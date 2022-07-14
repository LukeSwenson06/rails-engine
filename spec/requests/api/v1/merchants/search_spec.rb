require 'rails_helper'

RSpec.describe 'Merchant Search' do
  it "can one merchant with the search paramaters" do
    merchant1 = create(:merchant, name: "Alpinaud Leveilleur")
    merchant2 = create(:merchant, name: "Almeric de Borel")
    merchant3 = create(:merchant, name: "Thancred Waters")
    merchant4 = create(:merchant, name: "Y'shtola Rhul")

    get '/api/v1/merchants/find?name=aLpI'

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    merchants = response_body[:data].map do |merchant|
      merchant[:attributes][:name]
    end

    expect(merchants).to eq([merchant1.name])
    expect(merchants).to_not eq([merchant2.name, merchant3.name, merchant4.name])
  end
end
