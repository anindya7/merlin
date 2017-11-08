class AddScoreToQuizScores < ActiveRecord::Migration[5.1]
  def change
    add_column :quiz_scores, :score, :float
  end
end
