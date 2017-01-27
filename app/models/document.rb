class Document < ApplicationRecord
  has_many :document_tags
  accepts_nested_attributes_for :document_tags, reject_if: :all_blank, allow_destroy: true

  has_attached_file :file, path: ':rails_root/public/system/:class/:attachment/:id.:extension', url: '/system/:class/:attachment/:id.:extension'

  validates :shipment_id, presence: true
  validates :original_tags, presence: true
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file

end
