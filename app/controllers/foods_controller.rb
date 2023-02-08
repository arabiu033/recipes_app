class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    respond_to do |format|
      if @food.save
        format.hmtml { redirect_to food_path, notice: 'Food was successfully created.' }
      else
        flash[:error] = @food.errors.full_messages
        format.html { redirect_to new_food_path }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    respond_to do |format|
      format.html { redirect_to food_path(@food), notice: 'Food was successfully destroyed.' }
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :qunatity, :user_id)
  end
end
