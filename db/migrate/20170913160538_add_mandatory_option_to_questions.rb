class AddMandatoryOptionToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :mandatory, :boolean
  end
end
