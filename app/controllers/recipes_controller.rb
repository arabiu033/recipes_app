class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_path, notice: 'Recipe was successfully created.' }
      else
        flash[:error] = @recipe.errors.full_messages
        format.html { redirect_to new_recipe_path }
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = RecipeFood.includes(:food).where('recipe_id = ?', @recipe.id)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted Recipe: #{recipe.name}"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
