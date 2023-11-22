class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  version :standard do
    process resize_to_fit: [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_allowlist
  #   %w(jpg jpeg gif png)
  # end
end
