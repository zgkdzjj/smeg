module PdfComponents::AssetUrl
  include PdfComponents::Base
  # include ActionView::Helpers::AssetUrlHelper
  def upload_url url
    "#{Rails.root}/public/#{url}"
  end

  def image_url url
    # Rails.env.development? ? "#{Rails.root}/app/assets/images/pdf/#{url}" : ActionController::Base.helpers.asset_path("pdf/#{url}")
    "#{Rails.root}/public/pdf/images/#{url}"
  end

  def font_url url
    # Rails.env.development? ? "#{Rails.root}/app/assets/fonts/#{url}" : ActionController::Base.helpers.asset_path("#{url}")
    "#{Rails.root}/public/pdf/fonts/#{url}"
  end

end
