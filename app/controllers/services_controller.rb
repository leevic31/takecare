class ServicesController < ApplicationController
  before_action :get_organization

  # TODO figure out the right way to avoid this
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @services = @organization.services
    render json: @services
  end

  def create
    @service = @organization.services.build(service_params)
    @service.save
  end

  private

  def service_params
    params.require(:service).permit(:service_type, :duration, :price)
  end

  def get_organization
    @organization = Organization.find(params[:organization_id])
  end
end
