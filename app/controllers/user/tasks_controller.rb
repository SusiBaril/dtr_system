class User::TasksController < ApplicationController
  def index
    @tasks = Task.includes(:attendance).order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to user_tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to user_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end