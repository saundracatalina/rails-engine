require 'rails_helper'

describe Item do
  describe 'relationships' do
    it {should belong_to :merchant}
  end
  # describe 'validations' do
  #   it {validate_presence_of :name}
  #   it {validate_presence_of :description}
  #   it {validate_presence_of :unit_price}
  # end
end
