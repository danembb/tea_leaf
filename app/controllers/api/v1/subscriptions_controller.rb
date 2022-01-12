class Api::V1::SubscriptionsController < ApplicationController

    def create
        subscription = CustomerSubscription.new(subscription_params)
        if params[:title].nil? || params[:first_name].nil? || params[:last_name].nil? || params[:email].nil? || params[:address].nil?
            render json: { error: "Invalid parameters provided" }, status: :bad_request
        elsif user.save
            render json: SubscriptionsSerializer.new(subscription), status: 201
        end
    end



    private

    def subscription_params
        params.permit(:title, :first_name, :last_name, :email, :address)
    end
end