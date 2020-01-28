class Users::GivesController < ApplicationController

  def new
  	@give = Give.new
  end

  def create
    @give = Give.new(give_params)
    @give.user = current_user
    @give.save
    redirect_to users_gives_path
  end

  def update
    @give = Give.find(params[:id])
    @give.user = current_user
    @give.update(give_params)
    redirect_to users_gife_path
  end

  def index
    @gives = Give.all.order(created_at: :desc)
    @give = Give.new
  end

  def show
    @give = Give.find(params[:id])
    @comment = GiveComment.new
    @comments = @give.give_comments.order(created_at: :desc)
  end

  def hide
    @give = Give.find(params[:id])
    @give.update(is_deleted: true)
    redirect_to users_gives_path
  end

  private
  def give_params
  	params.require(:give).permit(:user_id, :item_name, :title, :body, :status, :is_deleted, item_images_item_images: [])
  end
end
