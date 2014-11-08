class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.integer :sol
      t.string :camera_type
      t.datetime :image_time
      t.timestamps
    end
  end
end
