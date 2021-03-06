class UserLink < ActiveRecord::Base
  RESOURCE_NAMES = {
      (GIT = 0) => 'github',
      (LINKEDIN = 1) => 'linkedin',
  }.freeze

  belongs_to :user
 def as_json(options = {})
   { id: id,
     user_id: user_id,
     resource_name: RESOURCE_NAMES[resource_name],
     link: link,
     created_at: created_at,
     updated_at: updated_at
   }
 end
end
