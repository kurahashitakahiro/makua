class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  attachment :post_image

  has_many :post_tags, dependent: :destroy

  belongs_to :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
