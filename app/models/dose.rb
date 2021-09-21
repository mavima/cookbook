class Dose < ApplicationRecord
  belongs_to :recipe
  before_validation :integer, if: :no_decimals?


  def no_decimals?
    self.amount % 1 == 0
  end

  def integer
    self.amount.round(0)
  end

end

