class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :breed
  belongs_to :size
end
