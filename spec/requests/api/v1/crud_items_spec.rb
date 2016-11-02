require 'rails_helper'

describe "Items API Controller" do
  it 'can display all items' do
    pending 'Need serializer to return everything except time stamps'
    #When I send a GET request to /api/v1/items 
    item = create :item, name: 'Name', description: 'Description', image_url: 'Image_Url'
    get 'api/v1/items'
    #I receive a 200 
    expect(response).to be_successful
    #JSON response containing all items 
    items = JSON.parse(response.body, symbolize_names: true)
    #And each item has an id,
    expect(items.first[:id]).to eq(item.id)
    #name, 
    expect(items.first[:name]).to eq('Name')
    #description, 
    expect(items.first[:description]).to eq('Description')
    #and image_url 
    expect(items.first[:image_url]).to eq('Image_Url')
    #but not the created_at or updated_at
    expect(items.first[:created_at]).to be_nil
    expect(items.first[:updated_at]).to be_nil
  end


  
  it 'can display an item' do
    pending 'Need serializer to return everything except time stamps'
    #When I send a GET request to /api/v1/items 
    item = create :item, name: 'Name', description: 'Description', image_url: 'Image_Url'
    get "api/v1/items/#{item.id}"
    #I eceive a 200 
    expect(response).to be_successful
    #JSON response containing all items 
    raw_item = JSON.parse(response.body, symbolize_names: true)
    #And each item has an id,
    expect(raw_item[:id]).to eq(item.id)
    #name, 
    expect(raw_item[:name]).to eq('Name')
    #description, 
    expect(raw_item[:description]).to eq('Description')
    #and image_url 
    expect(raw_item[:image_url]).to eq('Image_Url')
    #but not the created_at or updated_at
    expect(raw_item[:created_at]).to be_nil
  end

  it 'can create a new item' do
    #When I send a POST request to /api/v1/items 
    post "/api/v1/items?name=Item_name&description=Description&image_url=Image_Url"
    #with a name, description, and image_url 
    #I receive a 201 JSON response if the record is successfully created 
    expect(response.status).to eq(201)
    #And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    item = JSON.parse(response.body, symbolize_names: true)
    expect(item[:id]).to_not be_nil
    expect(item[:name]).to eq('Item_name')
    expect(item[:description]).to eq('Description')
    expect(item[:image_url]).to eq('Image_Url')
  end

  it 'can update an existing item' do
    #When I send a DELETE request to /api/v1/items/1
    item = create :item
    delete "api/v1/items/#{item.id}"
    #I receieve a 204 JSON response if the record was deleted
    expect(response.status).to eq(204)
    expect(Item.find_by(id: item.id)).to be_nil
  end
end
