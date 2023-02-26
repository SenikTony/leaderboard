class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    authenticate_or_request_with_http_basic("Admin Dashboard") do |name, password|
      name == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASSWORD"]
    end
  end
end
