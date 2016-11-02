class SearchController < ApplicationController
  def index
    @postal_code = params[:postal_code]
    response = BestBuyService.stores_by_postal_code(@postal_code)
    @total_stores = response[:total]
    @stores = response[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end
end
