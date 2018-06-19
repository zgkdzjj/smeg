module PdfLayout
  extend ActiveSupport::Concern

  include PdfComponents::Base
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  GREY        = 'EDEDED'
  DARK_GREY   = 'A0A0A0'
  ORANGE      = 'DF6859'
  DARK_ORANGE = 'D54130'
  BLACK       = '040404'
  LIGHT_BLUE  = 'cfdfe6'

  CONTENT_PADDING = 40
  FONT_SIZE = 10

  def build_columns opts={}, &block
    height            = opts.fetch(:height, 30)
    cols              = opts.fetch(:cols, [{ width: 50 }, { width: 50 }])
    padding           = opts.fetch(:padding, CONTENT_PADDING)
    border_color      = opts.fetch(:border_color, nil)
    background_color  = opts.fetch(:background_color, nil)

    bounding_box([padding, cursor], width: bounds.width-(padding*2), height: height) do
      col_margin = 0

      if border_color.present?
        stroke_color border_color
        stroke_bounds
      end

      if background_color.present?
        stroke do
          # fill_color background_color
          fill_color background_color
          fill_and_stroke_rectangle [padding/100,cursor], bounds.width, bounds.height
          fill_color BLACK
        end
      end

      usable_bounds = bounds.width-(col_margin*(cols.count-1))
      y_pos = 0

      cols.each_with_index do |col, index|
        col_width = usable_bounds*(col.fetch(:width, 0).to_f/100)
        bounding_box([y_pos, bounds.height], width: col_width, height: bounds.height) do
          debug_stroke_bounds
          block.perform "col_#{index}".to_sym
        end

        y_pos += col_width+col_margin
      end
    end
  end

end
