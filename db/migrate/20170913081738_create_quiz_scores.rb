class CreateQuizScores < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_scores do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :quiz, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.boolean :taken, :default => false
      t.timestamps
    end
    add_index :quiz_scores, [:user_id, :course_id]
    add_index :quiz_scores, [:user_id, :course_id, :quiz_id]
  end
end
