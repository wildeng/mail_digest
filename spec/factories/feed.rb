# spec/factories/user.rb

require 'faker'
FactoryBot.define do
  factory :feed do
    title { Faker::Superhero.name }
    url { 'https://weblog.rubyonrails.org/feed/atom.xml' }
  end
end
