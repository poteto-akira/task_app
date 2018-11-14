class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # 入力されたusernameを持つユーザーがデータベースに存在し、かつ入力されたパスワードが
    # そのユーザーのパスワードである場合のみ、if文がtrueになる
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1"? remember(user) : forget(user)
      # redirect_to("/", notice: "ログインしました")
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
