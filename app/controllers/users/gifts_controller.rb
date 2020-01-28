class Users::GiftsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :hide ]

  def new
  	@gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    @gift.save
    redirect_to users_gifts_path
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.user == current_user
        @gift.update(gift_params)
    end
    redirect_to users_gift_path
  end

  def index
  	gift = params[:q]
    @search = Gift.ransack(gift)
    @users = User.where(is_deleted: nil)
    x = []
    @users.each do |user|
      x << user.id
    end
    @result = @search.result(distinct: true).page(params[:page]).where(is_deleted: nil).where(user_id: x).per(10).order(created_at: :desc)
    # @gifts = Gift.all.order(created_at: :desc)
    @gift = Gift.new
  end

  def show
    @gift = Gift.find(params[:id])
    @comment = GiftComment.new
    @users = User.where(is_deleted: nil)
    x = []
    @users.each do |user|
      x << user.id
    end
    @comments = @gift.gift_comments.where(is_deleted: nil).where(user_id: x).order(created_at: :desc)
  end

  def hide
    @gift = Gift.find(params[:id])
    if @gift.user == current_user
        @gift.update(is_deleted: true)
    end
    redirect_to users_gifts_path
  end

  private
  def gift_params
  	params.require(:gift).permit(:user_id, :item_name, :title, :body, :status, :is_deleted, item_images_item_images: [])
  end
end
