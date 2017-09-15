class CreateOptionsOptionSetsJoinTable < ActiveRecord::Migration[5.1]
  def change
    # This is enough; you don't need to worry about order
    create_join_table :options, :option_sets do |t|
    end
  end
end
