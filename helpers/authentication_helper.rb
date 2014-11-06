module Sinatra
  module AuthenticationHelper
    def authenticate!
      if session[:current_user]
        @current_user ||= User.find(session[:current_user])
      else
        nil
      end
    end
  end
  helpers AuthenticationHelper
end