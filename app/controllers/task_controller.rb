class TaskController < ApplicationController
  include TaskHelper
  helper_method :sort_column, :sort_direction
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    if params[:current_state]
      @tasks = Task.all.order(sort_column + ' ' + sort_direction).state(params[:current_state])
    elsif params[:search]
      @tasks = Task.all.order(sort_column + ' ' + sort_direction).search(params[:search])
    else
      @tasks = Task.all.order(sort_column + ' ' + sort_direction)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:name],
                     content: params[:content],
                     user_id: current_user.id,
                     current_state: 1,
                    )
     deadline_check
    if @task.save
      redirect_to("/", notice: "タスクを登録しました") #引数に文字列を渡してもflash配列にメッセージを格納できる
    else
      redirect_to("/", notice: "タスクが正常に登録できませんでした")
    end
  end

  def next
    @task = Task.find_by(id: params[:id])
    if @task.current_state < 3
      @task.current_state += 1
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
    if @task.current_state > 0
      @task.current_state -= 1
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
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
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

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
end
