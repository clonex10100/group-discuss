class TopicsController < ApplicationController
  def index
    #Topic sorting
    @topics = Topic.all
  end

  def show
    #implement comment sorting
    @topic = Topic.find(params[:id])
    @group = @topic.group
    @comment = @topic.comments.build(user_id: current_user_id)
  end

  def new
    @group = Group.find(params[:group_id])
    @topic = Topic.new(group_id: @group.id, user_id: current_user_id)
  end

  def create
    Topic.create(topic_params)
    redirect_to '/'
  end
  
  private
  def topic_params
    params.require(:topic).permit(:group_id, :title, :content, :user_id)
  end
end
