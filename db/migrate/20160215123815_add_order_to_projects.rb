class AddOrderToProjects < ActiveRecord::Migration
  def change
    add_column(:projects, :order_pos, :integer, default: 0)
  end
end
