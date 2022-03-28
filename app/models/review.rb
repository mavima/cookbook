class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  mount_uploader :photo, PhotoUploader

  validates :content, presence: true
  validates :rating, presence: true
  validates :writer, presence: true, if: :guest_user?

  def guest_user?
    self.user.email.include?("@example.com")
  end

end
