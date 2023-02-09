class RecipesController < ApplicationController
  # load_and_authorize_resource

  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = RecipeFood.where('recipe_id = ?', @recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted Recipe: #{recipe.name}"
  end
end
