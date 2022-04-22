class Step < ApplicationRecord
  belongs_to :recipe
  before_save :capitalize_attributes

  def capitalize_attributes
    self.detail = capitalize_sentences(detail)
  end

  def capitalize_sentences(string)
    unless string.blank?
      string.split('.').map do |sentence|
        sentence.strip.capitalize
      end.join('. ')
    end
  end


end
