class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index #showing all categories of the current user
    @categories = Category.where("user_id = ?", current_user.id )
  end

  def show #showing category details with specific tasks
    @tasks = Task.where("category_id = ?", @category.id)
    if current_user.id == @category.user_id
      render :show
    else
      redirect_to "/categories"
    end
  end

  def new #adding new category
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id if current_user

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'The letter has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'The letter has been deleted.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :details, :user_id)
    end
end
