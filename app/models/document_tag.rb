class DocumentTag < ApplicationRecord
  belongs_to :document

  validates :document, presence: true
  validates :tag, presence: true
  validates :page_number, presence: true
end
