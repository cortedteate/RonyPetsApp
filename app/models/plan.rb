class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  belongs_to :product
  belongs_to :frecuency
  belongs_to :quantity
  
end
