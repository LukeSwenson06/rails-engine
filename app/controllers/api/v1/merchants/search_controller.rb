class Api::V1::Merchants::SearchController < ApplicationController
  def index
    search = Merchant.search_merchant(params[:name])
    render json: MerchantSerializer.new(search)
  end
end
