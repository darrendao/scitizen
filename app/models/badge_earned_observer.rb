# badge_earned_observer.rb
class BadgeEarnedObserver
  def update(changed_data)
    #description = changed_data[:description]

    # If user is your meritable model, you can query for it doing:
    user = User.where(sash_id: changed_data[:sash_id]).first

    # When did it happened:
    #datetime = changed_data[:granted_at]

    AchievementNotification.create(user_id: user.id, seen: false)
  end
end