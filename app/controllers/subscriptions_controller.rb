class SubscriptionsController < ApplicationController
  def create
    record = current_user.subscriptions.create(sub_params)
    if record.valid?
      redirect_back fallback_location: root_path, notice: 'Success!'
    else
      redirect_to root_path, alert: 'Failed.'
    end
  end

  def get_form
    @food = Food.find params[:food_id]
    @sub = Subscription.new
  end

  private
  def sub_params
    params.require(:subscription).permit(:food_id, :qty)
  end
end
