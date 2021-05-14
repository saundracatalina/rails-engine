require 'rails_helper'

describe 'create a merchant record' do
  describe 'happy path' do
    it 'creates a merchant' do
      merch1 = Merchant.create!(name: "I'm a merchant")
      merch2 = Merchant.create!(name: "I'm also a merchant")
      merch3 = Merchant.create!(name: "Bob")
      expect(Merchant.all.count).to eq(3)
      merchant_params = {name: "Steve"}
      merchant_headers = {"CONTENT_TYPE" => 'application/json'}
      post "/api/v1/merchants", headers: merchant_headers, params: JSON.generate(merchant_params)

      expect(response.status).to eq(201)
      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      merchants = json[:data]

      expect(Merchant.all.count).to eq(4)
      expect(merchants[:attributes][:name]).to eq("Steve")
    end
  end
end
