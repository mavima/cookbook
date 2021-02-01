class Recipe < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :doses, :inverse_of => :recipe, :dependent => :destroy
  has_many :steps, :inverse_of => :recipe, :dependent => :destroy
  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  mount_uploader :photo, PhotoUploader

end
