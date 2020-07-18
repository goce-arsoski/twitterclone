FactoryBot.define do
  factory :comment do
    user
    tweet

    body { 'Comment' }
  end
end
