class Users::PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :hide ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to users_posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user
        @post.update(post_params)
    end
    redirect_to users_post_path
  end

  def index
    post = params[:q]
    @search = Post.ransack(post)
    @users = User.where(is_deleted: nil)
    x = []
    @users.each do |user|
      x << user.id
    end
    @result = @search.result(distinct: true).page(params[:page]).where(is_deleted: nil).where(user_id: x).per(10).order(created_at: :desc)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
    @users = User.where(is_deleted: nil)
    x = []
    @users.each do |user|
      x << user.id
    end
    @comments = @post.post_comments.where(is_deleted: nil).where(user_id: x).order(created_at: :desc)
  end

  def hide
    @post = Post.find(params[:id])
    if @post.user == current_user
        @post.update(is_deleted: true)
    end
    redirect_to users_posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :post_image, :is_deleted)
  end
end
