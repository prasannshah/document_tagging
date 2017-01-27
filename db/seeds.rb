# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doc_tags = ["proforma_invoice", "packing_list", "commercial_invoice", "custom_invoice", "excise_invoice", "purchase_order", "certificate_of_origin", "freight_certificate", "high_sea_sales_invoice", "high_sea_sales_purchase_order", "high_sea_sales_contract", "miscellaneous_charges", "authorized_dealer_code", "ARE1", "ARE2", "ARE3", "statutory_declaration_form_SDF", "form_9", "shipping_bill_checklist", "shipping_bill", "checklist", "bill_of_entry", "EPCG", "DEPB", "DEEC", "shipping_instruction", "master_airway_bill_draft", "master_airway_bill", "booking_document", "export_delivery_order", "import_delivery_order", "bill_of_lading", "technical_writeup", "product_catalogue", "mill_test_certificate", "self_declaration_undertaking", "material_safety_data_sheet", "inspection_report", "phytosanitary_cetrificate", "health_certificate", "fumigation_certificate", "chemical_analysis_certificate", "letter_of_credit", "insurance_policy", "insurance_certificate"]
doc_tags.each do |tag|
  Tag.create!(name: tag)
end