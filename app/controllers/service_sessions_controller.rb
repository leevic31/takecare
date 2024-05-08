class ServiceSessionsController < ApplicationController
  before_action :get_service
  
  # TODO figure out the right way to avoid this
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    @sessions = @service.sessions
    render json: @sessions
  end

  def create
    @session = @service.sessions.build(session_params)
    @session.save
  end

  private 

  def session_params
    params.require(:session).permit(:title, :description, :duration, :price)
  end

  def get_service
    @service = Service.find(params[:service_id])
  end
end
