class Api::V1::MerchantsController < ApplicationController
  def index
    merchants = Merchant.all
    render json: MerchantSerializer.new(merchants), status: 200
  end

  def create
    merchant = Merchant.create(merchant_params)
    render json: MerchantSerializer.new(merchant), status: 201
  end

  def update
    begin
      merchant = Merchant.find(params[:id])
      merchant.update(name: params[:name])
      render json: MerchantSerializer.new(merchant), status: 202
    rescue
      error = ActiveRecord::RecordNotFound
      render json: {error: error.to_s}, status: :not_found
    end 
  end

  def destroy
    Merchant.destroy(params[:id])
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
