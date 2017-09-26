class AddExtraCourseDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :courses, :slide_deck_url, :string
  	add_column :courses, :slide_deck_title, :string
  	add_column :courses, :slide_deck_description, :string
  	add_column :courses, :audio_book_title, :string
  	add_column :courses, :audio_book_description, :string
  end
end
