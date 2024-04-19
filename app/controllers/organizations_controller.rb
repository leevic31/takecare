class OrganizationsController < ApplicationController
  # TODO figure out the right way to avoid this
  skip_before_action :verify_authenticity_token, only: [:create]

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
