FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "goce.arsoski#{n}@gmail.com" }
    name { 'Goce' }
    password { 'goce123' }
    password_confirmation { 'goce123' }
  end
end
