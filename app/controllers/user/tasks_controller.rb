class User::TasksController < ApplicationController
  def index
    @tasks = Task.includes(:attendance).order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Rails.logger.debug "TASK CREATE CALLED"

    attendance = Attendance.find_by(date: Date.current)

    unless attendance
      redirect_to user_tasks_path, alert: "No attendance found for today"
      return
    end

    @task = Task.new(task_params)
    @task.attendance = attendance

    if @task.save
      redirect_to user_tasks_path, notice: "Task created"
    else
      Rails.logger.debug @task.errors.full_messages
      render :new
    end
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
