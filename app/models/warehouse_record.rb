class WarehouseRecord < ApplicationRecord
  belongs_to :supplier
  belongs_to :products
end
