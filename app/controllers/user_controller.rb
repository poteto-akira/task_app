class UserController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to("/", notice: "ユーザー登録が完了しました")
    else
      render("new")
    end

  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    # update_attributesメソッドは属性のハッシュを受け取り、成功時には更新と保存を続けて同時に行う
    if @user.update_attributes(user_params)
      redirect_to("/", notice: "ユーザー情報を変更しました")
    else
      render"edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to("/", notice: "ユーザーを削除しました")
  end

  private

  # createメソッドからくる
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

  # beforeアクション

  # ログイン済みかユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url, notice: "ログインしてください"
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find_by(id: params[:id])
    # 遷移先のユーザーと現在ログイン中のユーザーが異なる場合、ホームにリダイレクトする
    redirect_to("/") unless current_user?(@user) # session_helper
  end
end
