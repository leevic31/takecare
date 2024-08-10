class CreateStaffService
  def initialize(user_params:)
    @user_params = user_params 
  end

  def call 
    user = User.new(@user_params)
    if user.save
      user.add_role(:staff)
      user
    else
      user.errors
    end 
  end
end
