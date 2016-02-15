class AddTranslationsForProjects < ActiveRecord::Migration
  def change
    rename_column(:projects, :info, :info_en)
    add_column(:projects, :info_ru, :string)
  end
end
