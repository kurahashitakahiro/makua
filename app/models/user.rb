class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted == nil)
  end

  has_many :rooms, dependent: :destroy
  has_many :gifts, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :gift_comments
  has_many :post_comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  attachment :user_image

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
