class ItemImage < ApplicationRecord
  belongs_to :give
  attachment :image
end
