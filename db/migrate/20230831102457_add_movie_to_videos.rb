class AddMovieToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :title, :text
  end
end
