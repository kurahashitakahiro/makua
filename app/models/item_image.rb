class ItemImage < ApplicationRecord
  belongs_to :gift
  attachment :item_image
end
