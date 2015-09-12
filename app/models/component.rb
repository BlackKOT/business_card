class Component < ActiveRecord::Base
  has_many :projects, through: :component_projects
  has_many :component_projects

  validates :name, presence: true, uniqueness: true

  COMPONENT_TYPES = {
    1 => 'framework',
    2 => 'test',
    3 => 'db',
    4 => 'css',
    5 => 'cloud',
    6 => 'payment',
    7 => 'js',
    8 => 'auth',
    9 => 'worker',
    10 => 'third_party',
    11 => 'markup'
  }

  def type_name
    COMPONENT_TYPES[type_id]
  end

  def as_json(options = {})
    { id: id, name: name, type_name: type_name }
  end
end
