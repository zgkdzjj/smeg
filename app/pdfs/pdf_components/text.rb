module PdfComponents::Text
  include PdfComponents::Base

  def paragraph text, opts: {}
    font_family   = opts.fetch(:font, 'Futura')
    align         = opts.fetch(:align, :left)
    style         = opts.fetch(:style, :normal)
    color         = opts.fetch(:colour, BLACK)
    font_size     = opts.fetch(:font_size, 8)
    leading       = opts.fetch(:leading, 2)
    p_space       = opts.fetch(:p_space, 5)

    font(font_family) do
      text text, style: style, align: align, size: font_size, color: color, inline_format: true, leading: leading rescue next
    end
    move_down p_space
  end

  def subheading text_1, opts: {}
    font_family = opts.fetch(:font, 'Futura')
    color       = opts.fetch(:colour, BLACK)
    font_size   = opts.fetch(:font_size, 10)
    align       = opts.fetch(:align, :left)
    box_height  = opts.fetch(:box_height, 19)
    padding_top = opts.fetch(:padding_top, 5)
    style       = opts.fetch(:style, :bold)

    build_columns({ height: box_height, cols: [{width: 100}], padding: 0}) do |on|
      on.col_0 do
        move_down padding_top
        font font_family do
          text text_1, style: style, align: align, size: font_size, color: color, inline_format: true
        end
      end
    end
  end

  def grid_list items
    items.each do |item|
      y = cursor

      if item[0] == 'Dimensions'

        bounding_box([0, y], width: 90) do
          paragraph item[0], opts: { font_size: 9, style: :bold }
        end

        bounding_box([90, y], width: bounds.width-50) do
          paragraph item[1], opts: { style: :bold }
        end

      else
        bounding_box([0, y], width: 90) do
          paragraph item[0], opts: { font_size: 9 }
        end

        if item[1].kind_of?(Array)
          bounding_box([90, y], width: bounds.width-50) do
            paragraph item[1].reject { |x| x.blank? }.join('<br/>')
          end
        else
          bounding_box([90, y], width: bounds.width-50) do
            paragraph item[1]
          end
        end
      end
    end
  end

  def details_box heading, details
    subheading heading
    break_line

    details.each do |d|
      paragraph d, opts: { p_space: 2 }
    end
    move_down 10
  end

end
