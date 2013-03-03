# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Override the directory where uploaded files will be stored.
  include Cloudinary::CarrierWave

  process :resize_to_limit => [724, nil, :fill]
  process :convert => 'jpg'

end
