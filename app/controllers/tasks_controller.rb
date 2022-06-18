class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index #showing all tasks of the current user
    @tasks = Task.where("user_id = ?", current_user.id )
  end

  def show #showing task details with specific tasks
    if current_user.id == @task.user_id
      render :show
    else
      redirect_to "/tasks"
    end
  end

  def new #adding new task
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

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
      redirect_to @task, notice: 'The letter has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'The letter has been deleted.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :details, :category_id, :due, :fin)
    end
end
