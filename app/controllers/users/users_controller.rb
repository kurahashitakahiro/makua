class Users::UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  private
    def user_params
        params.require(:user).permit(:user_image_id, :name, :is_deleted)
    end
end
