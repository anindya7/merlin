class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :name
      t.text :description
      t.integer :week
      t.integer :order_in_week
      t.belongs_to :course, foreign_key: true
      t.timestamps
    end
  end
end
