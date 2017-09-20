class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.joins(:image).where('keyword_id = :keyword AND images.collection_id = :collection', { collection: position_params[:collection_id], keyword: position_params[:keyword_id] })
    render json: @positions
  end

  # GET /positions/1
  def show
    render json: @position
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, location: collection_position_url(@position.image.collection_id, @position)
    else
      render json: @position, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /positions/1
  def update
    if @position.update(position_params)
      render json: @position, status: :created, location: collection_position_url(@position.image.collection_id, @position)
    else
      render json: @position, status: :unprocessable_entity, serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:position, :image_id, :keyword_id, :collection_id, :id])
    end
end
