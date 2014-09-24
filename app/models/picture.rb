class Picture < ActiveRecord::Base

  belongs_to :monument
  mount_uploader :image, ImageUploader

end
