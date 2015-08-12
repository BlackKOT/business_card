class CreateComponentProjects < ActiveRecord::Migration
  def change
    create_table :component_projects do |t|
      t.string :component_id
      t.string :integer
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
