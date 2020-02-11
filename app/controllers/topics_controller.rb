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
    @topic = Topic.new(group_id: params[:group_id], user_id: current_user_id)
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  private
  def topic_params
    params.require(:topic).permit(:group_id, :title, :content, :user_id)
  end
end
