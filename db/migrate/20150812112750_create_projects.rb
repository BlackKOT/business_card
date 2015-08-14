class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :company
      t.text :info

      t.timestamps null: false
    end
  end
end
