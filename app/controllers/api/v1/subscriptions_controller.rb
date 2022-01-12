class Api::V1::SubscriptionsController < ApplicationController
  before_action :require_valid_customer

  def create
    subscription = Subscription.new(subscription_params)
    if params[:title].nil? || params[:price].nil? || params[:frequency].nil?
      render json: { error: 'Invalid information provided' }, status: :bad_request
    elsif subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: :created
    end
  end

  private

  def current_customer
    Customer.find_by(id: params[:customer_id])    
  end

  def require_valid_customer
    render json: { error: 'Customer not found' }, status: :bad_request unless current_customer
  end

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :frequency, :status)
  end
end
