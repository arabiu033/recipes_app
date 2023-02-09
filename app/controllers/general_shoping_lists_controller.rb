class GeneralShopingListsController < ApplicationController
  def index
    @foods = Food.joins('LEFT JOIN recipe_foods ON
      recipe_foods.food_id = foods.id').where('recipe_foods.food_id IS NULL
      AND foods.user_id = ?', current_user.id)
    @count = @foods.count
    @sum = @foods.sum('price * foods.quantity')
  end
end
