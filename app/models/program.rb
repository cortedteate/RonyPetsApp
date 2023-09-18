class Program < ApplicationRecord
  belongs_to :pet
  belongs_to :product
  belongs_to :quantity
  belongs_to :user
  belongs_to :frecuency
end
