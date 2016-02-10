class User < ActiveRecord::Base
  mount_uploader :avatar, ::PictureUploader

  has_many :projects, through: :project_users
  has_many :project_users, dependent: :destroy

  accepts_nested_attributes_for :project_users, allow_destroy: true

  def info
    send("info_#{I18n.locale}")
  end

  def full_name
    "#{send("first_name_#{I18n.locale}")} #{send("last_name_#{I18n.locale}")}"
  end

  def as_json(options = {})
    { full_name: full_name, avatar_url: avatar.url || PictureUploader.default_url, id: id }
  end
end
