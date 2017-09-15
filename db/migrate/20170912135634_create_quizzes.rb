class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.belongs_to :course, foreign_key: true
      t.integer :week
      t.timestamps
    end
    add_index :quizzes, :course_id
  end
end
