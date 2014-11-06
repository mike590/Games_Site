module Sinatra
  module LinkHelper

    def link_to(url, body)
      "<a href='#{url}'>#{body}</a>"
    end

  end
  helpers LinkHelper
end