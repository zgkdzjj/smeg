class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :convert => 'jpg'

  if ENV['AMAZON_S3'].present?
    storage :fog
  else
    storage :file
  end

  # version :normal do
  #   process :mogrify
  # end

  def store_dir
    "#{ENV["HEROKU_RAILS_ENV"] || Rails.env}/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def url
    return 'https://placeimg.com/1080/720/arch' if ENV["FAKE_IMG"].present?
    super
  end

  def crop(geometry)
    image = MiniMagick::Image.open(self.file.read)
    crop_params = "#{geometry[:avatar_crop_w]}x#{geometry[:avatar_crop_h]}+#{geometry[:avatar_crop_x]}+#{geometry[:avatar_crop_y]}"
    image.crop(crop_params)
    image
  end

  def filename
    "#{mounted_as}_#{secure_token}.jpg" if original_filename.present?
  end

  protected

    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end

end
