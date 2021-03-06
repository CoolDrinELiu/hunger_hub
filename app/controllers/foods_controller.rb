class FoodsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy]

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
    if @food.valid?
      redirect_to root_path, notice: "All good!"
    else
      flash[:alert] = "Missing something to fill in with?"
      render :new
    end
  end

  def destroy
    r = Food.find(params[:id])
    if r.destroy
      redirect_to root_path, notice: "Removed"
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :desc, :logo)
  end
end
