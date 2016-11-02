class BestBuyService
  def self.stores_by_postal_code(postal_code)
    BestBuyService.new(postal_code).stores_by_postal_code
  end

  def initialize(postal_code)
    @postal_code = postal_code
  end

  def conn 
    Faraday.new(url: 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params[:apiKey] = ENV['BESTBUY_API_KEY']
      faraday.params[:format] = 'json'
      faraday.params[:pageSize]= 15
    end
  end

  def stores_by_postal_code
    parse "/stores(area(#{@postal_code},25))"
  end

  def parse(url)
byebug
    JSON.parse(response(url).body, symbolize_names: true)
  end

  def response(target)
    conn.get do |request|
      request.url target
    end
  end
end
