class Users::GiveCommentsController < ApplicationController

	before_action :set_comment, only: [:destroy]

	def create
      @comment = current_user.give_comments.build(comment_params)
      @comment.save!
      @give = Give.find(params[:give_id])
      @comments = @give.give_comments.order(created_at: :desc)
      render 'create.js.erb'
    end

    def hide
      @comment = Comment.find(params[:id])
      @give.update(is_deleted: true)
    end

    private
	  def set_comment
	    @comment = Comment.find_by(id: params[:id])
	  end

	  def comment_params
	    params.require(:give_comment)
	          .permit(:comment)
	          .merge(give_id: params[:give_id])
	  end
end
