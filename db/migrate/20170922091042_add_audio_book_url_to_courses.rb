class AddAudioBookUrlToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :audio_book_url, :string
  end
end
