class SearchController < ApplicationController
  def index
    raw_stores = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV['BESTBUY_API_KEY']}")
  end
end
