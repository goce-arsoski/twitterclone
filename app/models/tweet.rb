class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :user, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { maximum: 140 }
end
