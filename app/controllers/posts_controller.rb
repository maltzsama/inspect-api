class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  def index
    puts "try show this #{params[:page]}"
    puts "============="
    if params[:page]
      @posts = Post.paginate(page: params[:page], per_page: 10)
      total_pages = (Post.count / 10).ceil
      current_page = params[:page]
    else
      @posts = @posts = Post.paginate(page: 1, per_page: 10)
      total_pages = (Post.count / 10).ceil
      current_page = 1
    end
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
