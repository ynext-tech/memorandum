class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :shop, optional: true
  
end
