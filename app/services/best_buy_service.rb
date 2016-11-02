class BestBuyService
  def self.stores_by_postal_code(postal_code)
    BestBuyService.new(postal_code)
  end

  def initialize(postal_code)
    @postal_code = postal_code
  end

  def conn 
    Farday.new(url: 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
end
