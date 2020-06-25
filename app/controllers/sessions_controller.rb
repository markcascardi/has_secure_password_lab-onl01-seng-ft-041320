class SessionsController < ApplicationController

  def new
    render 'login'
  end


  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    if authenticated
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end
end
