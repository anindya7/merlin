class CreateQuizThresholds < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_thresholds do |t|
      t.string :name
      t.references :quiz, foreign_key: true
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
