class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.belongs_to :quiz, foreign_key: true
      t.belongs_to :option_set, foreign_key: true  #, class_name: 'OptionSet'
      t.timestamps
    end
    add_index :questions, :quiz_id
    add_index :questions, :option_set_id
  end
end
