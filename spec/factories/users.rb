FactoryBot.define do
  factory :user do
    name { 'John' }
    sequence(:email) { |n| "#{name.downcase}#{n}@test.com" }
    photo { 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg' }
    bio { "I'm a Software Developer" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { DateTime.now }
  end
end
