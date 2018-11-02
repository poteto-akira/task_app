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
    @task.save
    redirect_to("/")
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end




end
