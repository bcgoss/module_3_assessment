require 'rails_helper'

describe "Search" do
  it "returns a list of stores near a zipcode" do
    #As a user
    #When I visit "/"
    #And I fill in a search box with "80202" and click "search"
    #Then my current path should be "/search" (ignoring params)
    #And I should see stores within 25 miles of 80202
    #And I should see a message that says "17 Total Stores"
    #And I should see exactly 15 results
    #And I should see the long name, city, distance, phone number and store type for each of the 15 results
  end
end
