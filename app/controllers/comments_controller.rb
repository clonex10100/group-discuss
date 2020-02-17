class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to group_topic_path(@comment.topic.group, @comment.topic)
    else
      @topic = @comment.topic
      render 'topics/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :topic_id)
  end
end
