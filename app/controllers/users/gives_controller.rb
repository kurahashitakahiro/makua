class Users::GivesController < ApplicationController
  def create
    @give = Give.new(give_params)
    @give.save
    redirect_to users_posts_path
  end

  private
  def give_params
  	params.require(:give).permit(:user_id, :item_name, :title, :body, :status, :is_deleted)
  end
end
