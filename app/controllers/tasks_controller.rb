class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  

  def index #showing all tasks of the current user
    @tasks = current_user.tasks
  end

  def show #showing task details with specific tasks
    if current_user.id == @task.user_id
      render :show
    end
  end

  def new #adding new task
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'The task has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'The task has been deleted.'
  end

  private
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :details, :category_id, :due, :fin, :user_id, :favorite)
    end
end
