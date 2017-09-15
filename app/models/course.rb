class Course < ApplicationRecord
  has_many :videos
  has_many :views
  has_many :quizzes, class_name: 'Quiz'
  has_many :quiz_scores, class_name: 'QuizScore'
end
