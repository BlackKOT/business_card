class Image < ActiveRecord::Base
  mount_uploader :path, ::PictureUploader

  belongs_to :project
end
