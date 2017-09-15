class CreateOptionSets < ActiveRecord::Migration[5.1]
  def change
    create_table :option_sets do |t|
      t.string :name
      t.integer :noop  # number of options
      t.timestamps
    end
  end
end
