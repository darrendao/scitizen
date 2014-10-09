class CreateImage2Tests < ActiveRecord::Migration
  def change
    create_table :image2_tests do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
