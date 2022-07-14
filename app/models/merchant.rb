class Merchant < ApplicationRecord
  has_many :items

  def self.search_merchant(search_params)
     where("name ILIKE ?", "%#{search_params}%")
     .order(name: :asc)
     .limit(1)
  end
end
