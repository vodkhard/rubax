class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)

    @posts = @posts.where(category_id: params[:category]) if params[:category]

    paginate json: @posts, per_page: 10
  end

  def show
    render json: @post, status: :ok
  end

  def create
    puts post_params
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :bad_request
    end
  end

  def update
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      render status: :no_content
    else
      render json: @post.errors
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content, :post_type, :user_id, :category_id)
  end
end