class Users::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to users_posts_path
  end

  def index
  	@posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :post_image, :is_deleted)
  end
end
