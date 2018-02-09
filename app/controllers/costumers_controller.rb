class CostumersController < ApplicationController
  before_action :set_costumer, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @costumers = Costumer.paginate(page: params[:page], per_page: 10)
      total_pages = (Costumer.count / 10).ceil
      current_page = params[:page]
    else
      @costumers = Costumer.paginate(page: 1, per_page: 10)
      total_pages = (Costumer.count / 10).ceil
      current_page = 1
    end
    render json: @costumers, meta: PaginationHelper.pagination_meta(@costumers)
  end

  def show
    render json: @costumer
  end

  # POST /costumers/
  def create
    @costumer = Costumer.new(costumer_params)
    @costumer = current_user.id
    if @costumer.save
      render json: @costumer, status: :created, location: @costumer
    else
      render json: @costumer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /costumers/1
  def update
    if @costumer.update(costumer_params)
      render json: @costumer
    else
      render json: @costumer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /costumers/1
  def destroy
    @costumer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def costumer_params
      params.require(:costumer).permit(:name, :cnpj, :address, :contact, :fone)
    end
end