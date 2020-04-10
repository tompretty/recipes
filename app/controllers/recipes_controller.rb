class RecipesController < ApplicationController
  before_action :require_login

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.save
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :url, :image_url, :tag_list)
  end
end
