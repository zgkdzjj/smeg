module PdfComponents::Header
  include PdfComponents::Base

  def add_header pages=[]
    repeat(pages, :dynamic => true) do
      bounding_box([0, cursor], width: bounds.width, height: 60) do
        y = cursor
        image image_url("logo-black-hr.jpg"), at: [0, y], width: 170, height: 43
        image image_url("made-in-italy.png"), at: [bounds.width-109, y-6], width: 109, height: 36
        move_down 43
        break_line
      end
    end
  end

  def product_heading object
    paragraph "<b><font size='18'>#{object.model_number}</font></b>\n<font size='12'>#{object.try(:description).try(:upcase)}</font>", opts: { style: :normal }
    move_down 10
  end

end
