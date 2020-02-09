class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to topic_path(@comment.topic)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
