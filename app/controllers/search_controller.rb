class SearchController < ApplicationController
  def index
    raw_stores = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV['BESTBUY_API_KEY']}").body
    @stores = JSON.parse(raw_stores, symbolize_names: true).map do |raw_store|
      Store.new(raw_store)
    end
    @postal_code = '80202'
  end
end
