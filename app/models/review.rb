class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  mount_uploader :photo, PhotoUploader

  validates :content, presence: true
  validates :rating, presence: true
end
