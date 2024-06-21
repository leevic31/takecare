class User < ApplicationRecord
  # Associations
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :roles, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 12 }

  # Callbacks
  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end
  
  # Custom methods
  generates_token_for :email_verification, expires_in: 2.days do
    email
  end
  
  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  normalizes :email, with: -> { _1.strip.downcase }

  def has_role?(role_name)
    role.exists?(name: role_name)
  end

  def add_role(role_name)
    roles.create(name: role_name)
  end

  def remove_role(role_name)
    roles.where(name: role_name).destroy_all
  end
end
