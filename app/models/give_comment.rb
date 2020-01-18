class GiveComment < ApplicationRecord
  belongs_to :give
  belongs_to :user
end
