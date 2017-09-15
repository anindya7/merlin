class AddOrderInWeekToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :order_in_week, :integer
  end
end
