class UserController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(username: params[:username],
                     password: "foobar",password_confirmation: "foobar")
    if @user.save
      redirect_to("/", notice: "ユーザー登録が完了しました")
    else
      render("new")
    end

  end

  def update
  end

  def destroy
  end
end
