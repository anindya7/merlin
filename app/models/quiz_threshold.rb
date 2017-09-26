class QuizThreshold < ApplicationRecord
  
  # scope :find_by_value, lambda { |value| where('max >=', value).where('min <=', value) }
  belongs_to :quiz

  def self.find_threshold(value)
  	where('max >= ?', value).where('min <= ?', value)
  end

end
