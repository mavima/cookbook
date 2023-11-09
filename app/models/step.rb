class Step < ApplicationRecord
  belongs_to :recipe
  before_save :capitalize_attributes
  validates :detail, presence: true, format: { with: /\A[a-zA-Z0-9.:,;?!'"&\s]*\z/, message: ": no special characters allowed" }

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
