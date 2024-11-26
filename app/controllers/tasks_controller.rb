class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def show
    # This action should find a specific task, thanks to its id, directly from params.
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
  params.require(:task).permit(:title, :details, :completed)
  end

end
