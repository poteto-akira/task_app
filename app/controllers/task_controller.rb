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
  end

  def destroy
  end




end
