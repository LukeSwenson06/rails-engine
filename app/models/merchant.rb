class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.search_merchant(search_params)
     where("name ILIKE ?", "%#{search_params}%")
     .order(name: :asc)
     .first
  end

  def self.most_items(count)
    Merchant.joins(:items, invoices: [:transactions, :invoice_items]).where(transactions: {result: 'success'}, invoices: {status: 'shipped'}).select(:name, :id, 'COUNT(invoice_items.quantity) as count').group(:id).order(count: :desc).limit(count)

  end
end
