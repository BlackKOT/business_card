class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter -> {I18n.locale = params.fetch(:locale, 'en') }

protected
  def default_url_options
    { locale: I18n.locale }
  end
end
