class Quiz < ApplicationRecord
  has_many :questions
  belongs_to :course
  has_many :quiz_scores, class_name: "QuizScore"

  def self.ordered_in_week(week)
    where(week: week).order(:order_in_week)
  end

  def next_page
    # Find this week quiz
    @next_page = Quiz.where(course_id: self.course.id, week: self.week, order_in_week: self.order_in_week+1).first
    if self.week != self.course.total_weeks && @next_page.nil?
      # If not, find next week video
      @next_page = Video.where(course_id: self.course.id, week: self.week+1, order_in_week: 1).first
      if @next_page.nil?
        # If not, find next week quiz
        @next_page = Quiz.where(course_id: self.course.id, week: self.week+1, order_in_week: 1).first
      end
    end
    @next_page
  end

end
