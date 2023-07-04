class Breed < ApplicationRecord
  belongs_to :size 
  belongs_to :kind
end
