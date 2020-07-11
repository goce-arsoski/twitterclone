class Tweet < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :user, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { maximum: 140 }
end
