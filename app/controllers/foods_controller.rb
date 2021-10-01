class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    if !current_user.admin?
      redirect_to root_path, alert: "Cannot let you do that." and return
    end
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

  def get_form
    @food = Food.find params[:id]
  end
  private

  def food_params
    params.require(:food).permit(:name, :desc, :logo, :end_at)
  end
end
