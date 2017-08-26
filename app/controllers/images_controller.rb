class ImagesController < ApplicationController
  require 'stock'
  before_action :set_image, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /images
  def index
    @images = User.find(current_user.id).collections.find(params[:collection_id]).images.all
    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
  def create
    shutter = Stock::Shutterstock.new
    url = shutter.get_image(image_params[:image])
    merged_params = image_params
    merged_params['url'] = url
    # merged_params['user_id'] = current_user.id
    @image = Image.new(merged_params)
    # User.find(params[:user_id]).update()images.new(image_params)
    if @image.save
      render json: @image, status: :created
      # , location: @image
    else
      render json: @image, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    if @image.destroy
      render json: @image, status: :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = User.find(current_user.id).collections.find(params[:collection_id]).images.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:image, :url, :collection_id, :collection, :user, :id])
  end
end
