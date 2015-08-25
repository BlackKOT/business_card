class Comment < ActiveRecord::Base
  apply_simple_captcha message: 'is incorrect'

end
