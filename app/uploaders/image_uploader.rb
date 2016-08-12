# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :normal do
    process :crop
    resize_to_fill(200, 200)
  end

  version :fullfill do
    process :crop
    resize_to_fill(200, 200)
  end

  version :large do
    process :crop
    resize_to_limit(320, 320)
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(200, 200)
      model.manipulate! do |img|
        x=model.crop_x.to_i
        y=model.crop_y.to_i
        w=model.crop_w.to_i
        h=model.crop_h.to_i
        img.crop!(x,y,w,h)
      end
    end

  end


  # version :normal do
  #   process :resize_to_fit=>(200, 200)
  # end
  #
  # version :fullfill do
  #   process :resize_to_fill=>(200, 200)
  # end
  # kill -9 $(lsof -i tcp:3000 -t)

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
