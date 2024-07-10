class AvailabilityBlockPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end

  def create?
    user.has_role?(:staff_member)
  end
end
