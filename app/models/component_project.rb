class ComponentProject < ActiveRecord::Base
  belongs_to :component
  belongs_to :project
end
