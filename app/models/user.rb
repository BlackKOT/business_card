class User < ActiveRecord::Base
  mount_uploader :avatar, ::PictureUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, through: :project_users
  has_many :project_users, dependent: :destroy

  accepts_nested_attributes_for :project_users, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def as_json(options = {})
    { full_name: full_name, avatar_url: avatar.url || PictureUploader.default_url, id: id }
  end
end
