require 'rails_helper'

describe 'update a merchant record' do
  describe 'happy path' do
    it 'updates a merchant' do
      merchant = Merchant.create!(name: "Bob")
      merchant_headers = {'CONTENT_TYPE' => 'application/json'}
      merchant_params = {name: "Steve"}

      patch "/api/v1/merchants/#{merchant.id}", headers: merchant_headers, params: JSON.generate(merchant_params)

      expect(response.status).to eq(202)
      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      merchants = json[:data]

      expect(merchants[:attributes][:name]).to eq("Steve")
      expect(merchants[:attributes][:name]).to_not eq("Bob")
    end
  end
end
