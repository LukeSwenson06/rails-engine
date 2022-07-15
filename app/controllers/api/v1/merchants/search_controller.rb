class Api::V1::Merchants::SearchController < ApplicationController
  def index
    search = Merchant.search_merchant(params[:name])
    if search.present?
      render json: MerchantSerializer.new(search)
    else
      render json: {data: {}}, status: 400
    end
  end
end
