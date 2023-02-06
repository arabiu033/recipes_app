class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      respond_to do |format|
     format.hmtml {redirect_to @food, notice: 'Food was successfully created.'}
    else
      render :new
    end
  end

  def destroy
    @food =Food.find(params[:id])
    @food.destroy
    respond_to do |format|
    format.html { redirect_to food_path(@food), notice: 'Food was successfully destroyed.' }
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :qunatity, :user_id)  
  end
end
