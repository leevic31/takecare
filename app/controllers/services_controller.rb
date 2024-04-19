class ServicesController < ApplicationController
  # TODO figure out the right way to avoid this
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @services = Service.all
    render json: @services
  end

  def create
    # type = service_params[:service].to_sym
    # duration = service_params[:duration].to_int
    # price = service_params[:price].to_int

    @service = Service.new(service_params)
    @service.save
  end

  def service_params
    params.require(:service).permit(:type, :duration, :price)
  end
end
