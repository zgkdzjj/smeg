class BasePdf < Prawn::Document
  include PdfComponents::CoverPage
  include PdfComponents::AssetUrl
  include PdfComponents::Header
  include PdfComponents::Footer
  include PdfComponents::Text
  include PdfComponents::Inputs

  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper
  # include ActionView::Helpers::AssetUrlHelperx

private
  def load_fonts
    font_families.update(
        'Roboto' => {
                      :normal => font_url("Roboto/Roboto-Regular.ttf"),
                      :medium => font_url("Roboto/Roboto-Medium.ttf"),
                      :bold   => font_url("Roboto/Roboto-Medium.ttf")
                    },
        'Arial' => {
                    :normal => font_url("Arial/Arial.ttf"),
                    :italic => font_url("Arial/Arial-Italic.ttf"),
                    :bold => font_url("Arial/Arial-Bold.ttf"),
                    :bold_italic => font_url("Arial/Arial-Bold-Italic.ttf")
                  },
        'Futura' => {
                    :normal => font_url("FuturaMd/FuturaLT.ttf"),
                    :bold => font_url("FuturaMd/FuturaLT-Bold.ttf"),
                    :medium => font_url("FuturaMd/FutuMd.ttf"),
                    :medium_italic => font_url("FuturaMd/FutuMdLt.ttf"),
                    :medium_bold => font_url("FuturaMd/FutuBd.ttf"),
                    :medium_bold_italic => font_url("FuturaMd/FutuBdIt.ttf")
                  }
    )

    font 'Futura'
  end
end
