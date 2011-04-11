module ApplicationHelper

  #DRY flash messages
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error, :alert].each do|type|
      if flash[type]
        messages= "<div id=\"#{type}\">#{flash[type]}</div>".html_safe
      end
    end
    messages
  end

end
