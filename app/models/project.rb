class Project < ActiveRecord::Base
  has_many :components, through: :component_projects
  has_many :component_projects, dependent: :destroy
end
