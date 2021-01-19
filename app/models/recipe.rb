class Recipe < ApplicationRecord
  belongs_to :user


  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :instruction, presence: true, length: { minimum: 10 }
end
