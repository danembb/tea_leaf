class Api::V1::CustomersController < ApplicationController

    def create
        customer = Customer.new(customer_params)
        if params[:first_name].nil? || params[:last_name].nil? || params[:email].nil? || params[:address].nil?
            render json: { error: "Invalid parameters provided" }, status: :bad_request
        elsif customer.save
            render json: CustomersSerializer.new(customer), status: 201
        end
    end

    private

    def customer_params
        params.permit(:first_name, :last_name, :email, :address)
    end
end