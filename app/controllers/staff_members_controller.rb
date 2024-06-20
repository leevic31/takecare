class StaffMembersController < ApplicationController
  before_action :set_staff_member, only: [:update, :destroy]
  
  def index
    @staff_members = StaffMember.all
    render json: @staff_members
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)
    
    if @staff_member.save
      render json: @staff_member, status: :created
    else
      render json: @staff_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @staff_member.update(staff_member_params)
      render json: @staff_member
    else
      render json: @staff_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @staff_member.destroy
  end

  private

  def staff_member_params
    params.require(:staff_member).permit(:name)
  end

  def set_staff_member
    @staff_member = StaffMember.find(params[:id])
  end
end
