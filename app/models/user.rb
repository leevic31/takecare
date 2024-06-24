class User < ApplicationRecord
  # Associations
  belongs_to :role

  # Validations
  validates :role, presence: true
  
  # Custom methods
  def role_name
    role.name if role.present?
  end

  def admin?
    role_name == Role::ADMIN
  end

  def staff_member?
    role_name == Role::STAFF_MEMBER
  end

  def client?
    role_name == Role::CLIENT
  end
end
