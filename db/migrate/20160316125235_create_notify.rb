class CreateNotify < ActiveRecord::Migration
  def change
    create_table :notifies do |t|
      t.integer :notifiable_id
      t.string :notifiable_type
      t.string :description
      t.timestamps null: false
    end
  end
end
