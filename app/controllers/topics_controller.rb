class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    #Topic sorting
    @topics = case params[:sort]
    when '2'
      Topic.date_descending
    when '3'
      Topic.comments_descending
    when '4'
      Topic.comments_ascending
    else
      puts 's'
      Topic.date_ascending
    end.page params[:page]
    #@topics = Topic.comments_descending.page params[:page]
  end

  def show
    #implement comment sorting
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.build(user_id: current_user.id) if user_signed_in?
    if user_signed_in?
      #If the user has voted show their vote
      @vote = Vote.find_by_vote_container_and_topic(current_user.vote_container, @topic)
      #otherwise create an empty one
      @vote = @topic.votes.build(vote_container_id: current_user.vote_container.id) unless @vote
    end
  end

  def new
    @topic = Topic.new(group_id: params[:group_id], user_id: current_user.id)
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
