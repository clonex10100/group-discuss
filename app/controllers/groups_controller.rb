class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @topics = @group.topics.page params[:page]
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
