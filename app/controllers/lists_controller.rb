class ListsController < ApplicationController
  def new
    @list = List.new
    @project_id = params[:project_id]
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def create
    @project = Project.find(params[:list][:project_id])
    @list = List.new(params[:list])
    respond_to do |format|
      if @list.save
        format.html { redirect_to project_path(@project) }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def index
  end
end
