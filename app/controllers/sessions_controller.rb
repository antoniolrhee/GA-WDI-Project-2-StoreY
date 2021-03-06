class SessionsController < ApplicationController
  def new
    if current_user != nil
      redirect_to users_path
    end
  end

  def create
    user = User.where(email: params[:login][:email]).first
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
