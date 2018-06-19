class AvatarUploader < BaseUploader

  version :small do
    process :resize_to_fill => [48, 48]
  end

  version :medium do
    process :resize_to_fill => [120, 120]
  end

  version :large do
    process :resize_to_fill => [640, 640]
  end

  version :profile do
    process :resize_to_fill => [320, 320]
  end

  def url
    return 'https://lorempixel.com/320/320/people' if ENV["FAKE_IMG"].present?
    super
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
