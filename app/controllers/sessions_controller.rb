class SessionsController < ApplicationController

  def new
  end

  def create
    if !params[:name] || params[:name].empty?
        redirect_to '/sessions/new'
    else
      @user = User.find_or_create_by(name: params[:name])
        session[:user_id] = @user.id
        redirect_to '/'
    end
  end


  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
