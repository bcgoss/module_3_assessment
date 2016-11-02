class SearchController < ApplicationController
  def index
    @postal_code = params[:postal_code]
    response = BestBuyService.stores_by_postal_code(@postal_code)
#    response = JSON.parse(Faraday.get("https://api.bestbuy.com/v1/stores(area(#{@postal_code},25))?format=json&pageSize=15&apiKey=#{ENV['BESTBUY_API_KEY']}").body, symbolize_names: true)
    @total_stores = response[:total]
    @stores = response[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end
end
