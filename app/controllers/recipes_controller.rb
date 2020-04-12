class RecipesController < ApplicationController
  before_action :require_login
  before_action :set_recipe, only: [:edit, :update, :destroy]

  def index
    @recipes = current_user.recipes
    @recipes = @recipes.filter_by_tag(params[:tag]) if params[:tag]
    @recipes = @recipes.filter_by_name(params[:name]) if params[:name]

    @tags = current_user.recipes.tag_counts
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :url, :image_url, :tag_list)
  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end
end
