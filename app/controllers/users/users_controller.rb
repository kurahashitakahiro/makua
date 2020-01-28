class Users::UsersController < ApplicationController

  before_action :authenticate_user!, only: [:update, :hide ]

  def show
  	@user = User.find(params[:id])
  	@gifts = Gift.where(user_id: @user.id).page(params[:page]).where(is_deleted: nil).per(10).order(created_at: :desc)
  	@posts = Post.where(user_id: @user.id).page(params[:page]).where(is_deleted: nil).per(10).order(created_at: :desc)
  	if user_signed_in?
  	  @favorites = current_user.favorites.page(params[:page]).per(10).order(created_at: :desc)
  	  @currentEntries = current_user.entries
	    myRoomIds = [] #配列が入る箱を作る
	    @currentEntries.each do |entry| #カレントユーザーのentry 1件ずつだす
	      myRoomIds << entry.room.id # << は、右辺のentry.room.idを左辺のmyRoomIdsの中に入れる
	    end
	  	@anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: current_user.id).order(created_at: :desc)
	  	@currentUserEntry = Entry.where(user_id: current_user.id)
	    @userEntry = Entry.where(user_id: @user.id)
	    unless @user.id == current_user.id
	      @currentUserEntry.each do |currentuser|
	        @userEntry.each do |user|
	          if currentuser.room_id == user.room_id then
	            @isRoom = true
	            @roomId = currentuser.room_id
	            @room_deleted = currentuser.room
	            @room = Room.new
	        	@entry = Entry.new
	          end
	        end
	      end
	      unless @isRoom
	        @room = Room.new
	        @entry = Entry.new
	      end
	    end
	  end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
	    @user.update(user_params)
	end
    redirect_to users_user_path
  end

  def hide
    @user = User.find(params[:id])
    if @user == current_user
        @user.update(is_deleted: true)
        reset_session
    end
    redirect_to root_path
  end

  private
    def user_params
        params.require(:user).permit(:user_image, :name, :is_deleted)
    end
end
