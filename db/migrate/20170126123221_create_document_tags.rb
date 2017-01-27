class CreateDocumentTags < ActiveRecord::Migration[5.0]
  def change
    create_table :document_tags do |t|
      t.belongs_to :document
      t.string :page_number
      t.string :tag

      t.timestamps
    end
  end
end
