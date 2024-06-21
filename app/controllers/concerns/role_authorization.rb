module RoleAuthorization
    extend ActiveSupport::Concern
    
    included do
        before_action :authenticate
    end
    
    def check_admin_role
        unless Current.user.admin?
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end
end
