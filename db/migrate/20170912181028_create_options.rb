class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :text
      t.integer :value
      t.timestamps
    end
  end
end
