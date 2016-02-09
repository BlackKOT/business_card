class Comment < ActiveRecord::Base
  apply_simple_captcha message: 'is incorrect'

  validates :name, length: {mininum: 1, maximum: 127}, allow_blank: false
  validates :body, length: {mininum: 1, maximum: 1024}, allow_blank: false

end
