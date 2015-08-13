module ApplicationHelper
  def lang_option(lang_name)
    (link_to lang_name, root_path(locale: lang_name), class: "#{'selected' if I18n.locale == lang_name.to_sym}")
  end
end
