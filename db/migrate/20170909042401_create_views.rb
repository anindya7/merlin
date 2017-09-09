class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :video, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.boolean :played, :default => false
      t.timestamps
    end
    add_index :views, [:user_id, :course_id]
    add_index :views, [:user_id, :course_id, :video_id]
  end
end
