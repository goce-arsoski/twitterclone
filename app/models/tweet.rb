class Tweet < ApplicationRecord
  MAX_CONTENT_LENGTH = 140
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }
end
