class Api::V1::TeasController < ApplicationController
  def create
    tea = Tea.new(tea_params)
    if params[:name].nil? || params[:description].nil? || params[:keywords].nil? || params[:origin].nil? || params[:brew_time].nil? || params[:temperature].nil?
      render json: { error: 'Insufficient parameters provided' }, status: :bad_request
    elsif tea.save
      render json: TeasSerializer.new(tea), status: :created
    end
  end

  def index
    if params[:name].nil?
      render json: { error: 'Invalid name provided' }, status: :bad_request
    elsif params[:name]
      name = params[:name]
      tea = TeaFacade.one_tea(name)
      render json: TeasSerializer.new(tea), status: :ok
    end
  end

  def tea_params
    params.permit(:name, :image, :description, :keywords, :origin, :brew_time, :temperature, :comments)
  end
end
