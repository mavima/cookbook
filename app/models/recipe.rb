class Recipe < ApplicationRecord
  belongs_to :user
  has_many :doses, :inverse_of => :recipe, :dependent => :destroy
  accepts_nested_attributes_for :doses, allow_destroy: true, reject_if: :all_blank
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :instruction, presence: true, length: { minimum: 10 }
end
