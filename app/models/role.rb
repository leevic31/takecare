class Role < ApplicationRecord
    # Roles
    ADMIN = 'admin'
    CLIENT = 'client'
    STAFF_MEMBER = 'staff_member'

    # Associations
    has_many :users, dependent: :nullify

    # Validations
    validates :name, presence: true, inclusion: { in: [ADMIN, CLIENT, STAFF_MEMBER] }

    # Scopes
    scope :admin_role, -> { find_by(name: ADMIN) }
    scope :client_role, -> { find_by(name: CLIENT) }
    scope :staff_member_role, -> { find_by(name: STAFF_MEMBER) }

    # Custom methods
    # note: maybe don't need because we have scopes
    def self.admin
        find_by(name: ADMIN)
    end
    
    def self.client
        find_by(name: CLIENT)
    end

    def self.staff_member
        find_by(name: STAFF_MEMBER)
    end

    def self.all_roles
        {
            ADMIN => "Administrator",
            CLIENT => "Client",
            STAFF_MEMBER => "Staff Member"
        }
    end
end
