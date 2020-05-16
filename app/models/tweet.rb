class Tweet < ApplicationRecord
  validates :user, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 2, maximum: 300 }
end
