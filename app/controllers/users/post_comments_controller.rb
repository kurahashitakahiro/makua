class Users::PostCommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :destroy ]

	def create
      @comment = current_user.post_comments.build(comment_params)
      @comment.user = current_user
      @comment.save!
      @post = Post.find(params[:post_id])
      @comments = @post.post_comments.where(is_deleted: nil).order(created_at: :desc)
      render 'create.js.erb'
    end

    def destroy
      @comment = PostComment.find(params[:id])
      if @comment.user == current_user
          @comment.destroy
      end
    end

    private
	  def comment_params
	    params.require(:post_comment)
	          .permit(:comment)
	          .merge(post_id: params[:post_id])
	  end
end
