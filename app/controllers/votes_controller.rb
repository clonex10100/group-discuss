class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @topics = current_user.voted_topics.page params[:page]
  end
  def create
    vote = Vote.create(params_for_vote)
    redirect_to group_topic_path(vote.topic.group, vote.topic)
  end

  def update
    vote = Vote.find(params[:id])
    vote.update(value: params[:vote][:value])
    vote.save
    redirect_to group_topic_path(vote.topic.group, vote.topic)
  end

  private
  def params_for_vote
    params.require(:vote).permit(:user_id, :topic_id, :value);
  end
end
