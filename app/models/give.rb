class Give < ApplicationRecord
  has_many :item_images
  has_many :give_comments

  belongs_to :user
end
