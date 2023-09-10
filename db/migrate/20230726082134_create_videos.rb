class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.text :comment

      t.timestamps
    end
  end
end
