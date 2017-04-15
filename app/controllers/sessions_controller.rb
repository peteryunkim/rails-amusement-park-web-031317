class SessionsController < ApplicationController

  def new
  end

  def create
    user =  User.find_by(name: params[:user][:name])
    # binding.pry
    if user.present? && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end

  end

  def delete
    session.destroy
    redirect_to '/'
  end



end
