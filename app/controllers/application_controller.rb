class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def notify_new_achievements
    if current_user && !current_user.achievement_notifications.empty?
      current_user.achievement_notifications.delete_all
      flash.now[:notice] = "You have unlocked new achievements. Click #{view_context.link_to('here', url_for(current_user))} to see your achievements.".html_safe
    end
  end  
end
