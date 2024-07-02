class OrganizationsController < ApplicationController
  # TODO figure out the right way to avoid this
  # skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_organization, only: [:update, :destroy]

  def index
    @organizations = policy_scope(Organization)
    authorize Organization
    render json: @organizations
  end

  def show
    @organization = Organization.find(params[:id])
    render json: @organization
  end

  def create
    @organization = Organization.new(organization_params)
    authorize @organization

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @organization
    
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @organization
    @organization.destroy
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
