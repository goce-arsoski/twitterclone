class Comment < ApplicationRecord
  MAX_BODY_LENGTH = 140
  belongs_to :tweet
  belongs_to :user

  validates :body, presence: true, length: { maximum: MAX_BODY_LENGTH }
end
