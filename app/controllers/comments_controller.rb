class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)

    if params[:comment][:user_id] != ""
      @new_user = User.find_by(id: comment_params[:user_id])
    else
      @new_user = User.create(comment_params[:user_attributes])
    end
    comment.user = @new_user
    comment.save
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
