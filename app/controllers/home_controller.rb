class HomeController < ApplicationController
  def index
    @tasks = current_user.tasks
    @categories = current_user.categories
    @favorites = current_user.tasks.where("favorite = TRUE")
  end

end
