class User < ActiveRecord::Base
  mount_uploader :avatar, ::PictureUploader

  has_many :projects, through: :project_users
  has_many :project_users, dependent: :destroy

  validates :first_name_en, :first_name_ru, :last_name_en, :last_name_ru, :info_en, :info_ru, presence: true

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
