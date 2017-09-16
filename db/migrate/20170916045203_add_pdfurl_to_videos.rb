class AddPdfurlToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :pdf_url, :string
  end
end
