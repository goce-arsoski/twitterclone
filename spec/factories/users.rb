FactoryBot.define do
  factory :user do
    email { 'goce.arsoski@gmail.com' }
    name { 'Goce' }
    password { 'goce123' }
    password_confirmation { 'goce123' }
  end
end
