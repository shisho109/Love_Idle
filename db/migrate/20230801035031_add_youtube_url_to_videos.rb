class AddYoutubeUrlToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :youtube_url, :string
  end
end
