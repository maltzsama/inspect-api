class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  
  def index
    page = params[:page] || 1
    @posts = Post.paginate(page: page, per_page: 10)
    render json: @posts, meta: PaginationHelper.pagination_meta(@posts)
  end

  # GET /tsts/1
  def show
    render json: @post
  end

  # POST /tsts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tsts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tsts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
