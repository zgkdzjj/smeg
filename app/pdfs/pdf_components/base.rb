module PdfComponents
  module Base
    extend ActiveSupport::Concern

    include ActionView::Helpers::SanitizeHelper
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TextHelper

    WHITE       = 'ffffff'
    GREY        = 'EDEDED'
    DARK_GREY   = 'A0A0A0'
    ORANGE      = 'DF6859'
    DARK_ORANGE = 'D8422A'
    BLACK       = '040404'
    LIGHT_BLUE  = 'cfdfe6'
    BLUE        = '1E90FF'
    RED         = 'DC381F'
    NOT_BLACK   = '242628'

    CONTENT_PADDING = 10
    FONT_SIZE = 10

    INDENT=30

    DEBUG=false

    def debug_stroke_bounds colour=LIGHT_BLUE
      if DEBUG
        stroke_color colour
        stroke_bounds
      end
    end

    def indent num=1, &block
      @current_indent = num

      indent    = (((INDENT*num)))
      left_over = bounds.width-indent

      bounding_box([indent, cursor], width: left_over) do
        yield
        move_down 2
      end
    end

    def break_line opts={}
      stroke_color opts.fetch(:colour, BLACK)
      stroke { line [0, cursor], [opts.fetch(:width, bounds.width), cursor] }
      move_down opts.fetch(:padding, 5)
    end

  end
end
