class Video < ApplicationRecord
  scope :ordered_in_week, -> {order(:attr => :val)}
  belongs_to :course
  has_many :views

  def self.ordered_in_week(week)
    where(week: week).order(:order_in_week)
  end
end
