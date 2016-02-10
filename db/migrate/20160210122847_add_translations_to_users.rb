class AddTranslationsToUsers < ActiveRecord::Migration
  def change
    rename_column(:users, :first_name, :first_name_en)
    rename_column(:users, :last_name, :last_name_en)
    rename_column(:users, :info, :info_en)

    add_column(:users, :first_name_ru, :string)
    add_column(:users, :last_name_ru, :string)
    add_column(:users, :info_ru, :text)
  end
end
