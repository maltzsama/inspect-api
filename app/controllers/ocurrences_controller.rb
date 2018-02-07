class OcurrencesController < ApplicationController
  before_action :set_ocurence, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @ocurrences = Ocurrence.paginate(page: params[:page], per_page: 10)
      total_pages = (Ocurrence.count / 10).ceil
      current_page = params[:page]
    else
      page = 1
      @ocurrences = Ocurrence.paginate(page: page, per_page: 10)
      total_pages = (Ocurrence.count / 10).ceil
      current_page = page
    end
    render json: @ocurrences, meta: PaginationHelper.pagination_meta(@ocurrences)
  end

  def show
    render json: @ocurrence
  end

  def create
    @ocurrence = Ocurrence.new(ocurrence_params)
    if @ocurrence.save
      render json: @ocurrence, status: :created, location: @ocurrence
    else
      render json: @ocurrence.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ocurrence.update(ocurrence_params)
      render json: @ocurrence
    else
      render json: @ocurrence.errors, status: :unprocessable_entity
    end
  end

  def delete
    @ocurrence.destroy
  end

  private
  def set_ocurence
    @ocurrence = Ocurrence.find(params[:id])
  end
  
  def ocurrence_params
    params.require(:ocurrence).permit(:description)
  end
end
