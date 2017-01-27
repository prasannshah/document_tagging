class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :shipment_id
      t.string :original_tags

      t.timestamps
    end

    add_attachment :documents, :file
  end
end
