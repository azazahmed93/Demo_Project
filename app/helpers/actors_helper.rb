module ActorsHelper
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
end
