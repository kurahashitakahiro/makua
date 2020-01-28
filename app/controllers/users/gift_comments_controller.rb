class Users::GiftCommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :destroy ]

	def create
      @comment = current_user.gift_comments.build(comment_params)
      @comment.user = current_user
      @comment.save!
      @gift = Gift.find(params[:gift_id])
      @comments = @gift.gift_comments.where(is_deleted: nil).order(created_at: :desc)
      render 'create.js.erb'
    end

    def destroy
      @comment = GiftComment.find(params[:id])
      if @comment.user == current_user
          @comment.destroy
      end
    end

    private

	  def comment_params
	    params.require(:gift_comment)
	          .permit(:comment)
	          .merge(gift_id: params[:gift_id])
	  end
end
