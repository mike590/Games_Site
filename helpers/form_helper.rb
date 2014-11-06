module Sinatra
  module FormHelper
    def open_form(action, method = 'post', class_name = "", style = "")
      "<form class='#{class_name}' style='#{style}' action='#{action}' method='#{method}'>"
    end

    def button(body = "", type = 'submit')
      "<button type='#{type}'>#{body}</button>"
    end
  end
  helpers FormHelper
end