class Post < ApplicationRecord
  has_many :post_comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :post_tags

  belongs_to :user
end
