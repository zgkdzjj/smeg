class ImageUploader < BaseUploader

  # process :store_dimensions

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  version :medium do
    process :resize_to_fill => [540, 360]
  end

  version :large do
    process :resize_to_fill => [1080, 720]
  end

  def url
    return 'https://lorempixel.com/540/360/city' if ENV["FAKE_IMG"].present?
    super
  end

  def extension_white_list
    %w(jpg jpeg gif png tif tiff)
  end

  private

  # def store_dimensions
  #   if file && model
  #     model.width, model.height = `identify -format "%wx%h" #{file.path}`.split(/x/)
  #   end
  # end

end
