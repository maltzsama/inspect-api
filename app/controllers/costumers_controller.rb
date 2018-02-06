class CostumersController < ApplicationController
  before_action :set_costumer, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @costumers = Costumers.paginate(page: params[:page], per_page: 10)
      total_pages = (Costumers.count / 10).ceil
      current_page = params[:page]
    else
      @costumers = Costumers.paginate(page: 1, per_page: 10)
      total_pages = (Costumers.count / 10).ceil
      current_page = 1
    end
    render json: @costumers, meta: PaginationHelper.pagination_meta(@costumers)
  end

  def show
    render json: @costumer
  end

  # POST /tsts
  def create
    @costumer = Costumer.new(costumer_params)
    puts @costumer
    puts "======================="
    puts costumer_params
    puts "======================="
    if @costumer.save
      render json: @costumer, status: :created, location: @costumer
    else
      render json: @costumer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tsts/1
  def update
    if @costumer.update(costumer_params)
      render json: @costumer
    else
      render json: @costumer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tsts/1
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