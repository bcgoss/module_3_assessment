require 'rails_helper'

describe Api::V1::ItemsController, type: :controller do
  it 'can display all items' do
    #When I send a GET request to /api/v1/items 
    create :item, name: 'Name'
    get :index
    #I receive a 200 
byebug
    expect(response).to be_successful
    #JSON response containing all items 
    #And each item has an id,
    expect(response.body).to have_content('id')
    #name, 
    expect(response.body).to have_content('Name')
    #description, 
    expect(response.body).to have_content('')
    #and image_url 
    #but not the created_at or updated_at


  end
end
