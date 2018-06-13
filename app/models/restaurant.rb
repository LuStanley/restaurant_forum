class Restaurant < ApplicationRecord
  validates_presence_of :name

  mount_uploader :image, PhotoUploader

  belongs_to :category, optional: true

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)

  end
end
