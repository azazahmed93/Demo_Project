module ApplicationHelper
  def nav_link(link_text, link_path, http_method = nil)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      if http_method
        link_to(link_text, link_path, method: http_method)
      else
        link_to(link_text, link_path)
      end
    end
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-danger"
      when :notice
        "alert-success"
      when :warning
        "alert-warning"
      else
        flash_type.to_s
    end
  end

  def body_class_helper
    if user_signed_in? and current_user.admin?
      then ''
    elsif !user_signed_in?
       then 'body-style'
    else 'body-style'
    end
  end
end
