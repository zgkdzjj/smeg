module PdfComponents::Footer
  include PdfComponents::Base

  def add_footer pages=[]
    repeat(pages, :dynamic => true) do
      bounding_box([0, 40], width: bounds.width, height: 60) do
        break_line
        formatted_text_box [{text: "smeg.com.au", styles: [:normal]}], at: [0, cursor], align: :left, width: (bounds.width/2), inline_format: true, size: 12, color: GREY
        formatted_text_box [{text: "#{Date.today}", styles: [:normal]}], at: [(bounds.width/2), cursor], align: :right, width: (bounds.width/2), inline_format: true, size: 10, color: GREY
      end
    end
  end

end
