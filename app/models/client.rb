class Client < ApplicationRecord
    has_many :sales
    has_many :pets, dependent: :delete_all 
end
