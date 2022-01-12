class Api::V1::SubscriptionsController < ApplicationController
  before_action :require_valid_customer
  
  def index
    subscriptions = current_customer.subscriptions
    render json: SubscriptionsSerializer.new(subscriptions), status: :ok
  end

  def create
    subscription = Subscription.new(subscription_params)
    if params[:title].nil? || params[:price].nil? || params[:frequency].nil?
      render json: { error: 'Invalid information provided' }, status: :bad_request
    elsif subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: :created
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:id], customer_id: params[:customer_id])
    subscription.update(subscription_params)
    if subscription.save
      render json: SubscriptionsSerializer.new(subscription), status: :ok
    else
      render json: { error: 'Unable to find subscription' }, status: :bad_request
    end
  end

  private

  def current_customer
    Customer.find(params[:customer_id])    
  end

  def require_valid_customer
    render json: { error: 'Customer not found' }, status: :bad_request unless current_customer
  end

  def subscription_params
    params.permit(:customer_id, :tea_id, :title, :price, :frequency, :status)
  end
end
