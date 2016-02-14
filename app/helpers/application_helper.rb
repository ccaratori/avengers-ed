module ApplicationHelper
  
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-warning"
      when "alert"
        "alert-danger"
      when "notice"
        "alert-info"
    end
  end

  def title(title = nil)
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? content_for(:title) + ' | ' + "Avengers" : "Avengers"
    end
  end
  
end
