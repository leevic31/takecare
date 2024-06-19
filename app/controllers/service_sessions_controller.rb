class ServiceSessionsController < ApplicationController
  before_action :set_service
  before_action :set_service_session, only: [:update, :destroy]
  
  # TODO figure out the right way to avoid this
  # skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    @service_sessions = @service.service_sessions
    render json: @service_sessions
  end

  def create
    @service_session = ServiceSession.new(service_session_params)

    if @service_session.save
      render json: @service_session, status: :created
    else
      render json: @service_session.errors, status: :unprocessable_entity
    end
  end

  def update
    if @service_session.update(service_session_params)
      render json: @service_session
    else
      render json: @service_session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service_session.destroy
  end

  private 

  def service_session_params
    params.require(:service_session).permit(:title, :description, :duration, :price, :staff_member_id, :service_id)
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_service_session
    @service_session = ServiceSession.find(params[:id])
  end
end
