class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1"? remember(user) : forget(user)
      flash[:notice] = "ログインしました"
      redirect_back_or "/"
    else
      flash.now[:danger] = "invalid username/password combination"
      render"new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to("/", notice: "ログアウトしました")
  end
end
