class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :gives
  has_many :posts
  has_many :give_comments
  has_many :post_comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  attachment :use_image_id

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
