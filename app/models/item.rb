class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :unit_price

  # def self.search_item(search_params)
  #   where("name ILIKE ?", "%#{search_params}%")
  # end
end
