class TasksController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        # flash[:success] = "Success!"
        format.html { redirect_to(@list, :notice =>  "Success!") }
        format.js
      else
        format.html { redirect_to list_path(@list) , :alert => "Project must have a title and a public status." }
        format.js
      end
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end
end
