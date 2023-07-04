class Pet < ApplicationRecord
  belongs_to :client
  belongs_to :product
  belongs_to :breed
  belongs_to :size
end
