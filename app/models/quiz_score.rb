class QuizScore < ApplicationRecord
  belongs_to :quiz
  belongs_to :course

  def self.user_taken(user)
    where(user_id: user)
  end
end
