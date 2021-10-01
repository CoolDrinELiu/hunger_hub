class SettingsController < ApplicationController
  before_action :require_admin

  def new
    @record = Setting.new
  end

  def edit
    @record = Setting.find params[:id]
  end

  def create
    s = Setting.create(setting_params)
    if s.valid?
      redirect_to root_path, notice: "Set to #{s.cut_off_at.strftime("%Y-%m-%m %H:%M")}"
    else
      flash[:alert] = "Already have one, or something went wrong."
      render :new
    end
  end

  def update
    set = Setting.find(params[:id])
    if set.update(setting_params)
      redirect_to root_path, notice: "Set to #{set.cut_off_at.strftime("%Y-%m-%m %H:%M")}"
    end
  end
  private

  def setting_params
    params.require(:setting).permit(:cut_off_at)
  end
end
