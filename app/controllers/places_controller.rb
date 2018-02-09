class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @places = Place.paginate(page: params[:page], per_page: 10)
      total_pages = (Place.count / 10).ceil
      current_page = params[:page]
    else
      @places = Place.paginate(page: 1, per_page: 10)
      total_pages = (Place.count / 10).ceil
      current_page = 1
    end
    render json: @places, meta: PaginationHelper.pagination_meta(@places)
  end

  def show
    render json: @place
  end

  # POST /places/
  def create
    @place = Place.new(place_params)
    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  #TODO: rebuild all deletes
  # DELETE /costumers/1
  def destroy
    @place.destroy
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_costumer
    @place = Place.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def place_params
    params.require(:place).permit(:name, :location, :description, :costumer_id)
  end

end