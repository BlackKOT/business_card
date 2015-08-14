module Admin::ProjectsHelper
  def new_project
    Project.new.tap do |t|
      t.component_projects.new
    end
  end
end
