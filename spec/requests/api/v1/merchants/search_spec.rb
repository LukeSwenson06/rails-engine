require 'rails_helper'

RSpec.describe 'Merchant Search' do
  it "can one merchant with the search paramaters" do
    merchant1 = create(:merchant, name: "Alpinaud Leveilleur")
    merchant2 = create(:merchant, name: "Almeric de Borel")
    merchant3 = create(:merchant, name: "Thancred Waters")
    merchant4 = create(:merchant, name: "Y'shtola Rhul")

    get '/api/v1/merchants/find?name=aLpI'

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  

  end
end
