class CreateOptionsOptionSetsJoinTable < ActiveRecord::Migration[5.1]
  def change
    # This is enough; you don't need to worry about order
    create_join_table :options, :option_sets do |t|
      t.index :option_id
      t.index :option_set_id
    end
  end
end
