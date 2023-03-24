class Product < ApplicationRecord
  belongs_to :category
  belongs_to :supplier
  has_many :warehouse_records
  has_many :pets

  mount_uploader :image, ProductImageUploader
end
