class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :content, presence: true, format: { with: /\A[a-zA-Z0-9.:,;?!'"&\s]*\z/, message: ": no special characters allowed" }
end
