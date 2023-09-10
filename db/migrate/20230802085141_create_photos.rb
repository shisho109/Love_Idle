class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :group
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
