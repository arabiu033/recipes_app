class GeneralShopingListsController < ApplicationController
  def index
    @foods = Food.joins('LEFT JOIN recipe_foods ON
      recipe_foods.food_id = foods.id').where('recipe_foods.food_id IS NULL')
    @count = @foods.count
    @sum = @foods.sum('price * foods.quantity')
  end
end
