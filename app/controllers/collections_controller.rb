class CollectionsController < ApplicationController
  before_action :authenticate_user
  before_action :set_collection, only: [:show, :update, :destroy]

  # GET /collections
  def index
    @collections = User.find(current_user.id).collections.all.order(:name)
    render json: @collections
  end

  # GET /collections/1
  def show
    render json: @collection
  end

  # POST /collections
  def create
    merged_params = collection_params
    merged_params['user_id'] = current_user.id
    @collection = Collection.new(merged_params)

    if @collection.save
      render json: @collection, status: :created, location: @collection
    else
      render json: @collection, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      render json: @collection, status: :created, location: @collection
    else
      render json: @collection, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /collections/1
  def destroy
    if @collection.destroy
      render json: @collection, status: :no_content
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = User.find(current_user.id).collections.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def collection_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :id])
  end
end
