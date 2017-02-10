class Document < ApplicationRecord
  has_many :document_tags
  accepts_nested_attributes_for :document_tags, reject_if: :all_blank, allow_destroy: true

  has_attached_file :file, path: ':rails_root/public/system/:class/:attachment/:id.:extension', url: '/system/:class/:attachment/:id.:extension'

  validates :shipment_id, presence: true
  validates :original_tags, presence: true
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file

  def self.temp
    Dir.foreach('uploaded_documents') do |shipment_id|
      next if shipment_id == '.' or shipment_id == '..' or shipment_id == '.DS_Store'
      Dir.foreach("uploaded_documents/#{shipment_id}") do |original_tag|
        next if original_tag == '.' or original_tag == '..' or original_tag == '.DS_Store'
        Dir.foreach("uploaded_documents/#{shipment_id}/#{original_tag}") do |file|
          next if file == '.' or file == '..' or file == '.DS_Store'
          extension = File.extname("uploaded_documents/#{shipment_id}/#{original_tag}/#{file}")
          next if extension =~ /[0-9]$/
	  next if extension =~ /msg$/
          file = File.open("uploaded_documents/#{shipment_id}/#{original_tag}/#{file}")
	  next if file.size == 0
	  Document.create!(shipment_id: shipment_id, original_tags: original_tag, file: file)
        end
      end
    end
  end

end
