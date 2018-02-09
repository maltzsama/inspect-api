class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @inspections = Inspection.paginate(page: params[:page], per_page: 10)
      total_pages = (Inspection.count / 10).ceil
      current_page = params[:page]
    else
      @inspections = Inspection.paginate(page: 1, per_page: 10)
      total_pages = (Inspection.count / 10).ceil
      current_page = 1
    end
    render json: @inspections, meta: PaginationHelper.pagination_meta(@inspections)
  end

  def show
    render json: @inspection
  end

  # POST /inspections/
  def create
    @inspection = Inspection.new(inspection_params)
    if @inspection.save
      render json: @inspection, status: :created, location: @inspection
    else
      render json: @inspection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inspections/1
  def update
    if @inspection.update(inspection_params)
      render json: @inspection
    else
      render json: @inspection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inspections/1
  def destroy
    @inspection.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inspection
    @inspection = Inspection.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def inspection_params
    params.require(:inspection).permit(:name, :description, :place_id)
  end
end
