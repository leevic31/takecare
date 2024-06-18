class StaffMembersController < ApplicationController
  before_action :set_staff_member, only: [:update, :destroy]
  
  def index
    @staff_members = StaffMember.all
    render json: @staff_members
  end

  def create
    @staff_member = StaffMember.new(staff_member_params)
    @staff_member.save
  end

  def update
    @staff_member.update(staff_member_params)
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
