class SessionsController < ApplicationController
  def new
  end
  def create
    @name = params[:username]
    user = User.find_by(username: @name)
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        @user_val = true
        @pass_val = false
        render :new
      end
    else
      @user_val = false
      @pass_val = false
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
