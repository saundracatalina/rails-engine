require 'rails_helper'

describe 'get a specific merchant by id' do
  describe 'happy path' do
    it 'can retrieve a specific merchant' do
      merch1 = Merchant.create!(name: "I'm a merchant")
      merch2 = Merchant.create!(name: "I'm also a merchant")
      merch3 = Merchant.create!(name: "Bob")

      get "/api/v1/merchants/#{merch2.id}"

      json = JSON.parse(response.body, symbolize_names: true)
      merchants = json[:data]

      expect(response.status).to eq(200)
      expect(response).to be_successful
      
    end
  end
end
