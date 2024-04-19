class StaffMembersController < ApplicationController
  def index
    @staff_members = StaffMembers.all
    render json: @staff_members
  end
end
