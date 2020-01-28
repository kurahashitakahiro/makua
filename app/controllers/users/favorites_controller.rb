class Users::FavoritesController < ApplicationController

	before_action :set_variables
  def create
  	favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
  	favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

  private
  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#favorite-link-#{@post.id}"
  end
end
