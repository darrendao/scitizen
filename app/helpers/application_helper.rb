module ApplicationHelper
  def bootstrap_class_for flash_type
   { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def determine_active(my_controller)
    if current_page?(:controller => my_controller)
      return "class='active'".html_safe
    end
  end

  def user_icon
    ret = ""
    if current_user && current_user.role?(:super_admin)
      ret = "<span class='glyphicon glyphicon-user' style='color: #CC0000;'></span>"
    elsif current_user
      ret = "<span class='glyphicon glyphicon-user'></span>"
    end
    ret.html_safe
  end
end
