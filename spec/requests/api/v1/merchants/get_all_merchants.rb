require 'rails_helper'

describe 'request for all merchants' do
  describe 'happy path' do
    it 'returns all merchants' do
      merch1 = Merchant.create!(name: "I'm a merchant")
      merch2 = Merchant.create!(name: "I'm also a merchant")
      merch3 = Merchant.create!(name: "Bob")

      get '/api/v1/merchants'

      expect(response.status).to eq(200)
      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      merchants = json[:data]

      expect(merchants.count).to eq(3)
      merchants.each do |merch|
        expect(merch[:type]).to eq("merchant")
        expect(merch[:attributes]).to be_a(Hash)
        expect(merch[:attributes][:name]).to be_a(String)
      end
      expect(merchants[0][:attributes][:name]).to eq("I'm a merchant")
      expect(merchants[1][:attributes][:name]).to eq("I'm also a merchant")
      expect(merchants[2][:attributes][:name]).to eq("Bob")
    end
  end
end
