class Recipe < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  # has_and_belongs_to_many :categories
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :doses, :inverse_of => :recipe, :dependent => :destroy
  has_many :steps, :inverse_of => :recipe, :dependent => :destroy
  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
  # validates :photo, presence: true, blob: { size_range: 1..(3.megabytes) }
  validates :description, presence: true, length: { minimum: 5 }
  mount_uploader :photo, PhotoUploader
  # validate :photo_validation
  # validates: :photo, file_size: { less_than: 2.megabytes }

  include PgSearch::Model
  # scope name whatever
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    associated_against: {
      doses: :ingredient,
      categories: :name
    },

    using: {
      tsearch: {prefix: true }
    }


  def photo_validation
    if self.photo
      if photo.blob.byte_size > 3000000
        photo.purge
        errors[:base] << 'Too big'
      end
    end
  end

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

  def blank_stars
   5 - self.average_rating.to_i
  end

  scope :favourited_by, -> (email) { joins(:favourites).where(favourites: { user: User.where(email: email) }) }

end
