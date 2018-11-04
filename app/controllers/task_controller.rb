class TaskController < ApplicationController

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:name],
                     content: params[:content])
    if @task.save
      # flash[:notice] = "タスクを登録しました"
      redirect_to("/", notice: "タスクを登録しました") #引数に文字列を渡してもflash配列にメッセージを格納できる
    else
      redirect_to("/", notice: "タスクが正常に登録できませんでした")
    end
  end

  def show
    @task = Task.find_by(id: params[:id]) #URLからタスクのidを取得して@Taskに代入
  end

  def edit #タスクの編集ページ
    @task = Task.find_by(id: params[:id]) #URLからタスクのidを取得して@Taskに代入

  end

  def update
    @task = Task.find_by(id: params[:id]) #URLからタスクのidを取得して@Taskに代入
    @task.name = params[:name]
    @task.content = params[:content]
    if @task.save
      redirect_to("/", notice: "タスクを編集しました")
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/", notice: "タスクを削除しました")
  end




end
