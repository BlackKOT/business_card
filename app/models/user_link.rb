class UserLink < ActiveRecord::Base
  RESOURCE_NAMES = {
      (GIT = 0) => 'Git',
      (LINKEDIN = 1) => 'LinkedIn',
  }.freeze

  belongs_to :user

end
