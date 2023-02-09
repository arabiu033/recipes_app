class PublicRecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @public_recipes = Recipe.where('public = ?', true).order(updated_at: :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @public_recipes }
    end
  end

  def show
    redirect_to recipe_path(Recipe.find(params[:id]))
  end
end
