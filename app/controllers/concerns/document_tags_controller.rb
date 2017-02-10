class DocumentTagsController < ApplicationController

  def index
    @tags = DocumentTag.group(:tag).count.keys
    hash = {}
    @tags.each do |tag|
      @docs = DocumentTag.where(tag: tag).all
      hash[tag] = []
      @docs.each do |doc|
        @original_doc = Document.find(doc.document_id)
        hash[tag] << {page_number: doc.page_number, tag: doc.tag, shipment_id: @original_doc.shipment_id, original_tags: @original_doc.original_tags, file_file_name: @original_doc.file_file_name}
      end
    end
    render json: hash
  end

  # protected
  # def tag_params
  #   params.fetch(:tag, {}).permit(:name)
  # end
end