class Project < ActiveRecord::Base
  has_many :components, through: :component_projects
  has_many :component_projects, dependent: :destroy
  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :component_projects, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
