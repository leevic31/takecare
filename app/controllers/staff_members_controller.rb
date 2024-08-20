class StaffMembersController < ApplicationController
  def create
    result = CreateStaffService.new(user_params: user_params).call  

    if result.is_a?(User)
      render json: result, status: :created
    else
     render json: result, status: :unprocessable_entity 
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name) 
  end
end
