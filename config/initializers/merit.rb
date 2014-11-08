# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
  config.add_observer 'BadgeEarnedObserver'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
Merit::Badge.create!(
  id: 1,
  name: "Bronze Annotator",
  description: "Created 5 annotations",
  custom_fields: { difficulty: :bronze, url: 'badges/annotator_bronze.png' }
)
Merit::Badge.create!(
  id: 2,
  name: "Silver Annotator",
  description: "Created 20 annotations",
  custom_fields: { difficulty: :silver, url: 'badges/annotator_silver.png' }
)
Merit::Badge.create!(
  id: 3,
  name: "Gold Annotator",
  description: "Created 100 annotations",
  custom_fields: { difficulty: :silver, url: 'badges/annotator_gold.png' }
)

Merit::Badge.create!(
  id: 4,
  name: "Star Gazer",
  description: "Annotated stars in images",
  custom_fields: { difficulty: :silver, url: 'badges/stargazer.png' }
)

Merit::Badge.create!(
  id: 5,
  name: "Rover Lover",
  description: "Created annotations relating to the rover",
  custom_fields: { difficulty: :silver, url: 'badges/roverlover.png' }
)
