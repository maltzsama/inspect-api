class OccurrencesController < ApplicationController
  before_action :set_occurence, only: [:show, :update, :destroy]

  def index
    page = params[:page] || 1
    @occurrences = Occurrence.paginate(page: page, per_page: 10)
    render json: @occurrences, meta: PaginationHelper.pagination_meta(@occurrences)
  end

  def show
    render json: @occurrence
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)
    @occurrence.user_id = 2 #current_user.id
    if @occurrence.save
      render json: @occurrence, status: :created, location: @occurrence
    else
      render json: @occurrence.errors, status: :unprocessable_entity
    end
  end

  def update
    if @occurrence.update(occurrence_params)
      render json: @occurrence
    else
      render json: @occurrence.errors, status: :unprocessable_entity
    end
  end

  def delete
    @occurrence.destroy
  end

  private
  def set_occurence
    @occurrence = Occurrence.find(params[:id])
  end
  
  def occurrence_params
    params.require(:occurrence).permit(:description, :picture, :deadline_id, :problem_id, :severity_id, :inspection_id, :solution)
  end
end
