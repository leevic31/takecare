class ServicesController < ApplicationController
  before_action :set_organization, only: [:idnex, :create]
  before_action :set_service, only: [:update, :destroy]

  def index
    @services = @organization.services
    authorize Service

    render json: @services
  end

  def create
    @service = @organization.services.build(service_params)
    authorize @service

    if @service.save
      render json: @service, status: :created
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @service

    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @service
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
