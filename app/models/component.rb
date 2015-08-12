class Component < ActiveRecord::Base
  has_many :projects, through: :component_projects
  has_many :component_projects, dependent: :destroy

end
