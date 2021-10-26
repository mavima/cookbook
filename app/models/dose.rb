class Dose < ApplicationRecord
  belongs_to :recipe
  before_validation :integer, if: :no_decimals?


  def no_decimals?
    unless self.amount == nil
      self.amount % 1 == 0
    end
  end

  def integer
    self.amount.round(0)
  end

end

