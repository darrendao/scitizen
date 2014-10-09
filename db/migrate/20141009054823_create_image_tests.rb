class CreateImageTests < ActiveRecord::Migration
  def change
    create_table :image_tests do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
