require 'rails_helper'

RSpec.describe 'Merchants API' do
  it "sends a list of merchants" do
    create_list(:merchant, 3)
    get '/api/v1/merchants'

    response_body = JSON.parse(response.body, symbolize_names: true)
    merchants = response_body[:data]

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(merchants).not_to be_empty

    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an(String)

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes][:name]).to be_a(String)

      expect(merchant[:attributes]).to_not have_key(:created_at)
      expect(merchant[:attributes]).to_not have_key(:updated_at)

    end
  end
  it "sends a list of 1 merchants details" do
    merchants = create_list(:merchant, 3)
    merchant_id = merchants.first.id

    get "/api/v1/merchants/#{merchant_id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    merchant = response_body[:data]


    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(merchant).to have_key(:id)
    expect(merchant[:id]).to be_an(String)

    expect(merchant).to have_key(:attributes)
    expect(merchant[:attributes][:name]).to be_a(String)

    expect(merchant[:attributes]).to_not have_key(:created_at)
    expect(merchant[:attributes]).to_not have_key(:updated_at)

  end

  # it "can get all the items from a given merchant" do
  #   merchants = create_list(:merchant, 3)
  #   merchant_id = merchants.first.id
  #   item1 = create(:item, merchant: merchants.first)
  #   item2 = create(:item, merchant: merchants.last)
  #
  #   get "/api/v1/merchants/#{merchant_id}/items"
  #
  #   response_body = JSON.parse(response.body, symbolize_names: true)
  #   merchant_items = response_body[:data]
  #
  #   expect(response).to be_successful
  #   expect(response).to have_http_status(200)
  #
  #   expect(merchant_items).to have_key(:id)
  #   expect(merchant_items[:id]).to be_an(String)
  #
  #   expect(merchant_items).to have_key(:attributes)
  #   expect(merchant_items[:attributes][:name]).to be_a(String)
  #   expect(merchant_items[:attributes][:description]).to be_a(String)
  #   expect(merchant_items[:attributes][:unit_price]).to be_a(Integer)
  #
  # end
end
