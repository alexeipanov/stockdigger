class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /keywords
  def index
    @keywords = User.find(current_user.id).collections.find(params[:collection_id]).keywords.all
    render json: @keywords
  end

  # GET /keywords/1
  def show
    render json: @keyword
  end

  # POST /keywords
  def create
    @keyword = Keyword.new(keyword_params)

    if @keyword.save
      render json: @keyword, status: :created
      #, location: @keyword
    else
      render json: @keyword.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /keywords/1
  def update
    if @keyword.update(keyword_params)
      render json: @keyword
    else
      render json: @keyword.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keywords/1
  def destroy
    if @keyword.destroy
      render json: @keyword, status: :no_content
      # , location: @keyword
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = User.find(current_user.id).collections.find(params[:collection_id]).keywords.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def keyword_params
      # params.require(:keyword).permit(:keyword, :collection_id)
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:keyword, :collection_id, :user, :id, :collection])
    end
end
