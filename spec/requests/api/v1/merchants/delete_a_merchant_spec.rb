require 'rails_helper'

describe 'delete a merchant record' do
  describe 'happy path' do
    it 'can delete a merchant record' do
      merchant = Merchant.create!(name: 'Bob')
      expect(Merchant.count).to eq(1)

      delete "/api/v1/merchants/#{merchant.id}"

      expect(response.status).to eq(204)
      expect(Merchant.count).to eq(0)
    end
  end
end
