class TopicsController < ApplicationController
  def index
    @topics = Topic.all
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
