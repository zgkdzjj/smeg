module ProductPdf
  class SummarySheet < BasePdf
    include PdfLayout

    def initialize(product)
      super(margin: [30, 30], page_size: 'A5', page_layout: :portrait)

      load_fonts

      # @product = product
      @object = PdfHelper::Product::SummarySheetSerializer.new(product)

      page_1
    end

    def page_1
      build_columns({ height: bounds.height, cols: [{width: 100}], padding: 0}) do |on|
        on.col_0 do
          build_header
          build_content
          build_footer
        end
      end
    end

    def build_header
      bounding_box([0, bounds.height], width: bounds.width, height: 100) do
        fill_color BLACK
        fill_rectangle [0, bounds.height], bounds.width, bounds.height

        move_down 15

        image image_url(@object.product_brand_label), at: [bounds.width/3, bounds.height-20], width: bounds.width/3, height: 70
      end
    end

    def build_content
      build_columns({ height: bounds.height, cols: [{width: 100}], padding: 55}) do |on|
        on.col_0 do

          move_down 20
          paragraph "#{@object.description}", opts: { font_size: 10, p_space: 0 }

          stroke_color BLACK
          stroke { line [0, cursor+5], [bounds.width, cursor+5] }

          move_down 5
          paragraph "#{@object.model_number}**", opts: { font_size: 18, p_space: 0 }
          paragraph "**Please refer to price list for individual colour codes.", opts: { font_size: 6, p_space: 0 }

          move_down 10
          build_feature_list
        end
      end
    end

    def build_feature_list
      @object.features_list.each do |feature|
        paragraph "#{feature.fetch(:title)}", opts: { font_size: 12, p_space: 0 }
        paragraph "#{feature.fetch(:desc)}", opts: { font_size: 8, p_space: 0 }
        move_down 10
      end
    end

    def build_footer
      bounding_box([0, 80], width: bounds.width, height: 100) do
        # 90.84 is the width of the made-in-italy image with 30 height
        image image_url("made-in-italy.png"), at: [bounds.width/2-(90.84/2), bounds.height+10], height: 30

        fill_color BLACK
        fill_rectangle [0, bounds.height-30], bounds.width, bounds.height-40

        move_down 40
        text "#{@object.price_label}", style: :normal, align: :center, size: 45, color: WHITE, inline_format: true

      end
    end

  end
end
