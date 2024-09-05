# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_role = Role.find_or_create_by!(name: :admin)
client_role = Role.find_or_create_by!(name: :client)
staff_member_role = Role.find_or_create_by!(name: :staff_member)

organization = Organization.find_or_create_by!(name: 'Example Organization')

service = Service.find_or_create_by!(
  service_type: 'Massage',
  organization: organization,
  durations: [60]
)

staff_member = User.find_or_create_by!(
  email: 'staff@example.com',
  password: 'securepassword',
  password_confirmation: 'securepassword'
  first_name: 'John',
  last_name: 'Doe'
)

staff_member.roles << staff_member_role unless staff_member.roles.include?(staff_member_role)

availability_block = AvailabilityBlock.find_or_create_by!(
  start_time: Time.zone.now.beginning_of_day + 9.hours,
  end_time: Time.zone.now.beginning_of_day + 17.hours,
  user: staff_member,
  service: service
)

p 'Seed data created successfully!'
