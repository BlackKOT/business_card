class CreateUserLinks < ActiveRecord::Migration
  def change
    create_table :user_links do |t|
      t.integer :user_id
      t.integer :resource_name
      t.string :link
      t.timestamps null: false
    end
  end
end
