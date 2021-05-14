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
  describe 'sad path' do
    it 'throws a 404 when an id that does not exist is entered for a patch' do
      merchant = Merchant.create!(name: "Bob")
      fake_merchant_id = 9999999
      merchant_headers = {'CONTENT_TYPE' => 'application/json'}
      merchant_params = {name: "Steve"}

      patch "/api/v1/merchants/#{fake_merchant_id}", headers: merchant_headers, params: JSON.generate(merchant_params)

      expect(response.status).to eq(404)
    end
  end
end
