class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_filter -> {I18n.locale = params[:locale] if params[:locale].present?}

protected
  def default_url_options
    { locale: I18n.locale }
  end

  def pagination(objs, page, pre_count = 2)
    if objs.is_a? Array
      Kaminari.paginate_array(objs).page(page.to_i).per(pre_count)
    else
      objs.page(page.to_i).per(pre_count)
    end
  end
end
