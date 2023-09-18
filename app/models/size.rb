class Size < ApplicationRecord
    has_many :quantities
    has_many :pets, through: :breeds
end
