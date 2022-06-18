class HomeController < ApplicationController
  def index
    # @tasks = Task.where("user_id = ?", current_user.id )
    @tasks = Task.where("due = ? AND user_id = ?", Date.today, current_user.id)
  end

private
  def set_task
    @task = Task.find(params[:id])
  end
end
