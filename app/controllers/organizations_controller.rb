class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
    render json: @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    render json: @organization
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save
  end

  def organization_params
    params.require(:organization).permit(:name)
  end
end
