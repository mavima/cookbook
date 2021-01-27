class Recipe < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :doses, :inverse_of => :recipe, :dependent => :destroy
  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :instruction, presence: true, length: { minimum: 10 }
  mount_uploader :photo, PhotoUploader

end
