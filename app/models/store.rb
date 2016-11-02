class Store
  attr_reader :name, :city, :distance, :phone_number, :type_of_store, :store_id
  def initialize(raw_store)
    @name = raw_store[:name]
    @city = raw_store[:city]
    @distance = raw_store[:distance]
    @phone_number = raw_store[:phone]
    @type_of_store = raw_store[:storeType]
    @store_id = raw_store[:storeId]
  end
end
