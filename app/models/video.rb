class Video < ApplicationRecord
  scope :ordered_in_week, -> {order(:attr => :val)}
  belongs_to :course
  has_many :views

  def self.ordered_in_week(week)
    where(week: week).order(:order_in_week)
  end

  def next_page
    # Find this week video
    @next_page = Video.where(course_id: self.course.id, week: self.week, order_in_week: self.order_in_week+1).first
    if @next_page.nil?
      # If not, find this week quiz
      @next_page = Quiz.where(course_id: self.course.id, week: self.week, order_in_week: 1).first
      if @next_page.nil?
        if self.week != self.course.total_weeks
          # If not, Find next week video
          @next_page = Video.where(course_id: self.course.id, week: self.week+1, order_in_week: 1).first
          if @next_page.nil?
            # If not, find next week quiz
            @next_page = Quiz.where(course_id: self.course.id, week: self.week+1, order_in_week: 1).first
          end
        end
      end
    end
    @next_page
  end
end
