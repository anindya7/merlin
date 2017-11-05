class AddSdUrlToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :sd_url, :string
  end
end
