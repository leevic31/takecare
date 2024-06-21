class ServicesController < ApplicationController
  include RoleAuthorization

  before_action :set_organization
  before_action :set_service, only: [:update, :destroy]
  before_action :check_admin_role

  # TODO figure out the right way to avoid this
  # skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @services = @organization.services
    render json: @services
  end

  def create
    @service = @organization.services.build(service_params)
    @service.save
  end

  def update
    @service.update(service_params)
  end

  def destroy
    @service.destroy
  end

  private

  def service_params
    params.require(:service).permit(:service_type)
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_service
    @service = @organization.services.find(params[:id])
  end
end
