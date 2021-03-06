class Quiz < ApplicationRecord
  has_many :questions
  belongs_to :course
  has_many :quiz_thresholds, dependent: :destroy
  has_many :quiz_scores, class_name: "QuizScore", dependent: :destroy

  validates_presence_of :name, :course_id, :week, :order_in_week
  validates_uniqueness_of :course_id, scope: [:week, :order_in_week]

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

  def max_score
    max = 0
    questions = self.questions
    questions.each do |q|
      max += q.max_score
    end
    max
  end

  def find_threshold(value)
    threshs = self.quiz_thresholds.find_threshold(value)
    if threshs.any?
      thresh = threshs.first.name
    else
      thresh = nil
    end
    thresh
  end

end
