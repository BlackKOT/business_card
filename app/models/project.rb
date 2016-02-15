class Project < ActiveRecord::Base
  has_many :components, through: :component_projects
  has_many :component_projects, dependent: :destroy
  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :name, :info_en, :info_ru, presence: true
  validates :order_pos, presence: true, numericality: true

  accepts_nested_attributes_for :component_projects, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  def info
    send("info_#{I18n.locale}")
  end

  def as_json(options = {})
    { image_url: images.first.try(:url) || PictureUploader.default_url, id: id, name: name }
  end
end
