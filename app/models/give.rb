class Give < ApplicationRecord
  has_many :item_images
  has_many :give_comments

  belongs_to :user

  accepts_attachments_for :item_images, attachment: :image
end
