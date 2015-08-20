class AddComponentProjectConstraints < ActiveRecord::Migration
  def up
    execute 'alter table component_projects add constraint fk_component '\
      'foreign key (component_id) references components(id)'
  end

  def down
    execute 'alter table component_projects drop constraint fk_component'
  end
end
