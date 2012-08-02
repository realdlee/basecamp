class TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(params[:task])
    if @task.save
      flash[:success] = "Success!"
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), :alert => "Project must have a title, and public status."
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
