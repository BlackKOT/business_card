class Referral < ActiveRecord::Base
  include Rails.application.routes.url_helpers


  belongs_to :referrer,  class_name: 'User', :foreign_key => 'user_id'
  belongs_to :referred,  class_name: 'User', :foreign_key => 'new_user_id'

end
