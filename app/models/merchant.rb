class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.search_merchant(search_params)
     where("name ILIKE ?", "%#{search_params}%")
     .order(name: :asc)
     .first
  end
end
