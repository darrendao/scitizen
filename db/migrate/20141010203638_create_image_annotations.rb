class CreateImageAnnotations < ActiveRecord::Migration
  def change
    create_table :image_annotations do |t|
      t.string :src
      t.string :shapes
      t.string :text
      t.references :user, index: true
      t.references :image, index: true

      t.timestamps
    end
  end
end
