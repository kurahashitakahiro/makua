class Users::PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to users_posts_path
  end

  def index
  	@posts = Post.all
    @post = Post.new
    @gives = Give.all
    @give = Give.new
  end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :post_image, :is_deleted)
  end
end
