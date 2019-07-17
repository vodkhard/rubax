class UpvotesController < ApplicationController
  before_action :authenticate_user
  before_action :set_upvote, only: %i[show update destroy]

  # GET /upvotes
  def index
    @upvotes = Upvote.all

    render json: @upvotes
  end

  # GET /upvotes/1
  def show
    render json: @upvote
  end

  # POST /upvotes
  def create
    params[:user_id] = current_user.id

    if Upvote.exists?(user_id: params[:user_id])
      render status: :conflict
    else
      @upvote = Upvote.new(upvote_params)

      if @upvote.save
        render json: @upvote, status: :created
      else
        render json: @upvote.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /upvotes/1
  def update
    if @upvote.update(upvote_params)
      render json: @upvote
    else
      render json: @upvote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /upvotes/1
  def destroy
    @upvote.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_upvote
    @upvote = Upvote.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def upvote_params
    params.permit(:user_id, :post_id)
  end
end
