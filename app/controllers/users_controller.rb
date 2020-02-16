class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.page params[:page]
  end
end
