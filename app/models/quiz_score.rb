class QuizScore < ApplicationRecord
  belongs_to :quiz
  belongs_to :course

  validates_presence_of :user_id, :course_id, :quiz_id, :taken
  validates_uniqueness_of :user_id, scope: [:course_id, :quiz_id]

  def self.user_taken(user)
    where(user_id: user)
  end
end
