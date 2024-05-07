class DaysController < ApplicationController
   # TODO figure out the right way to avoid this
   skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @days = Day.all
    render json: @days
  end

  def show
    @day = Day.find(params[:id])
    render json: @day
  end

  def create
    @day = Day.new(day_params)
    @day.save
  end

  private

  def day_params
    params.require(:day).permit(:date)
  end
end
