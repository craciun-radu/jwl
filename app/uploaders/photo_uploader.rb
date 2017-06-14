# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # after :remove, :unlink_original

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fill:  [35, 35]
  end

  version :medium do
    process resize_to_fill:  [100, 100]
  end

  version :large do
    process resize_to_fill:  [205, 205]
  end

  def scale(width, height)
    # do something
  end

  # def cache_dir
  #   "#{Rails.root}/tmp/uploads"
  # end

  # def unlink_original(file)
  #   return unless delete_original_file
  #   file.delete if version_name.blank?
  # end
end
