class CreateComponentProjects < ActiveRecord::Migration
  def change
    create_table :component_projects do |t|
      t.integer :component_id, null: false
      t.integer :project_id, null: false

      t.timestamps null: false
    end
  end
end
