class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null: false

      t.timestamp
    end
  end
end
