class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
    binding.pry
    if params[:title].nil? || params[:price].nil? || params[:frequency].nil?
      render json: { error: 'Invalid information provided' }, status: :bad_request
    elsif subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: :created
    end
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :frequency, :status)
  end
end
