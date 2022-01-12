class Api::V1::SubscriptionsController < ApplicationController
  def create
    binding.pry
    subscription = Subscription.create(cust_subscription_params)
    binding.pry
    if params[:customer_id].nil? || params[:subscription_id].nil?
      render json: { error: 'Invalid information provided' }, status: :bad_request
    elsif subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: :created
    end
  end

  private

  def subscription_params
    params.permit(:customer_id, :subscription_id)
  end
end
