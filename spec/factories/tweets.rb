FactoryBot.define do
  factory :tweet do
    user

    content { 'tweet' }
  end
end
