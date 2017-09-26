class AddResultTextToQuiz < ActiveRecord::Migration[5.1]
  def change
  	add_column :quizzes, :result_text, :string
  end
end
