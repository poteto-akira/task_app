class TaskController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @task = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:name],
                     content: params[:content],
                     user_id: current_user.id,
                     current_task_id: 1)
    # @task = current_user.tasks.build(task_params)
    if @task.save
      # flash[:notice] = "タスクを登録しました"
      redirect_to("/", notice: "タスクを登録しました") #引数に文字列を渡してもflash配列にメッセージを格納できる
    else
      redirect_to("/", notice: "タスクが正常に登録できませんでした")
    end
  end

  def next
    @task = Task.find_by(id: params[:id])
    if @task.current_task_id < 3
      @task.current_task_id += 1
      if @task.save
        redirect_to("/")
      else
        redirect_to("/", notice: "失敗しました")
      end
    else
      redirect_to("/", notice: "失敗しました")
    end
  end

  def back
    @task = Task.find_by(id: params[:id])
    if @task.current_task_id > 0
      @task.current_task_id -= 1
      if @task.save
        redirect_to("/")
      else
        redirect_to("/", notice: "失敗しました")
      end
    else
      redirect_to("/", notice: "失敗しました")
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

private
  def task_params
    params.require(:task).permit(:name)
  end


end
