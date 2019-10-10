class ApplicationController < ActionController::Base
  before_action :check_environment


  def check_environment
    if ENV['USERNAME'].nil? || ENV['PASSWORD'].nil?
        redirect_to('/setup.html')
        return
    end
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end
