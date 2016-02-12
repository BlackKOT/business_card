module ApplicationHelper
  def lang_option(lang_name)
    exp = /\/en(\/|$)|\/ru(\/|$)/

    lang_url = if (request.path =~ exp)
      request.path.gsub(exp, "/#{lang_name}/")
    else
      uri = URI.parse(request.path)
      uri.query = Rack::Utils.parse_nested_query(uri.query).merge('locale' =>  lang_name).to_query
      uri.to_s
    end

    link_to(lang_url) do
      content_tag(:div, '&nbsp;', class: "flag #{lang_name.to_sym}_flag #{'selected' if I18n.locale == lang_name.to_sym}")
    end.html_safe
  end

  def ng_link(link)
    URI::decode_www_form_component link
  end
end
