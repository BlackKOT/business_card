module ApplicationHelper
  def lang_option(lang_name)
    link_to(root_path(locale: lang_name)) do
      content_tag(:div, '&nbsp;', class: "flag #{lang_name.to_sym}_flag #{'selected' if I18n.locale == lang_name.to_sym}")
    end
  end
end
