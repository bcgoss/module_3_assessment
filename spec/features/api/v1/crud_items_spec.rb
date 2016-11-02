require 'rails_helper'

describe ItemsController do
  it 'can display all items' do
    create :item, name: 'Name'
    visit '/api/v1/items'
    expect(response).to be_successful
    expect(response.body).to have_content('Name')
  end
end
