class Recipe < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :doses, :inverse_of => :recipe, :dependent => :destroy
  has_many :steps, :inverse_of => :recipe, :dependent => :destroy
  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  mount_uploader :photo, PhotoUploader

  def average_rating
    reviews = self.reviews
    average_rating = 0
    if reviews.length > 0
      sum = 0
      reviews.each do |review|
        sum += review.rating
      end
      num = reviews.count
      average_rating = (sum / num)
    end
    average_rating
  end

end
