class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name}"
      redirect_to root_path
    else
      flash.now[:error] = "Upps Try Again.."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Bye"
    redirect_to login_path
  end


end
