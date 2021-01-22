class Dose < ApplicationRecord
  belongs_to :recipe


  def even?
    self%1==0 && self.to_i.even?
  end

end
