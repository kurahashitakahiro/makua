class Give < ApplicationRecord
  has_many :item_images
  has_many :give_comments, dependent: :destroy

  belongs_to :user

  accepts_attachments_for :item_images, attachment: :item_image

  enum status:{Yet:0,Done:1}
end
