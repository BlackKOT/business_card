# http://startbootstrap.com/template-overviews/sb-admin-2/

class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin'

  http_basic_authenticate_with name: ENV['LOGIN'], password: ENV['PASS']
end
