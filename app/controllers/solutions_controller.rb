class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :update, :destroy]

  def index
    if params[:page]
      @solutions = Solution.paginate(page: params[:page], per_page: 10)
      total_pages = (Solution.count / 10).ceil
      current_page = params[:page]
    else
      page = 1
      @solutions = Solution.paginate(page: 1, per_page: 10)
      total_pages = (Solution.count / 10).ceil
      current_page = page
    end
    render json: @solutions, meta: PaginationHelper.pagination_meta(@solutions)
  end

  def show
    render json: @solution
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      render json: @solution, status: :created, location: @solution
    else
      render json: @solution.errors, status: :unprocessable_entity
    end
  end

  def update
    if @solutions.update(solution_params)
      render json: @solutions
    else
      render json: @solutions.errors, status: :unprocessable_entity
    end
  end

  def delete
    @solutions.destroy
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])
  end

  def solution_params
    params.require(:solution).permit(:description)
  end
end
