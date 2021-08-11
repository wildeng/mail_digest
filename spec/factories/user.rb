# spec/factories/user.rb

require 'faker'
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'Password123!' }
    password_confirmation { 'Password123!' }
    # TODO insert the code to create a user
  end
end
