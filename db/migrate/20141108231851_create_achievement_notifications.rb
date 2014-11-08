class CreateAchievementNotifications < ActiveRecord::Migration
  def change
    create_table :achievement_notifications do |t|
      t.references :user, index: true
      t.boolean :seen

      t.timestamps
    end
  end
end
