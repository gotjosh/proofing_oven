class ProfileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  
  process :resize_to_fit => [200, 200]

  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    "acorn.png"
  end
  
end
