class ApplicationController < ActionController::Base
  #protect_from_forgery

  USER_NAME, PASSWORD = 'jdc', '5DD58603-2688-4448-BB39-D87E5429FABF'

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == USER_NAME && password == PASSWORD
    end
  end
end
