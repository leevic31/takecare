class ServicePolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
  end
  
  def index?
    user.has_role?(:admin)
  end

  def create?
    user.has_role?(:admin)
  end

  def update?
    user.has_role?(:admin)
  end

  def destroy?
    user.has_role?(:admin)
  end
end
