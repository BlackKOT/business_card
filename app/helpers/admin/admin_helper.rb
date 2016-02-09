module Admin::AdminHelper
  def ng_link(link)
    URI::decode_www_form_component link
  end
end
