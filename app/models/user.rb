class User < ActiveRecord::Base
  mount_uploader :avatar, ::PictureUploader

  has_and_belongs_to_many :projects#, through: :project_users
  # has_many :project_users, dependent: :destroy
  has_many :user_links, dependent: :destroy
  has_many :notifies, as: :notifiable

  has_many :children, class_name:  'User', :foreign_key => 'new_user_id'
  has_many :employers, class_name:  'User', :foreign_key => 'employers_id'

  validates :first_name_en, :first_name_ru, :last_name_en, :last_name_ru, :info_en, :info_ru, presence: true

  # accepts_nested_attributes_for :project_users, allow_destroy: true
  accepts_nested_attributes_for :user_links, allow_destroy: true

  def info
    send("info_#{I18n.locale}")
  end

  def full_name
    "#{send("first_name_#{I18n.locale}")} #{send("last_name_#{I18n.locale}")}"
  end

  def as_json(options = {})
    { full_name: full_name,
      avatar_url: avatar.url || PictureUploader.default_url,
      id: id,
      user_links: user_links.as_json}
  end
end
