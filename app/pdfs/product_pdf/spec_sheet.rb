module ProductPdf
  class SpecSheet < BasePdf
    include PdfLayout

    def initialize(product)
      super(margin: [30, 40], page_size: 'A4', page_layout: :portrait)

      load_fonts

      # @product = product
      @object = PdfHelper::Product::SpecSheetSerializer.new(product)

      add_header([1,2,3])
      add_footer([1,2,3])

      page_1
      start_new_page
      page_2
      start_new_page
      page_3
    end

    def page_1
      move_down 70
      build_columns({ height: (bounds.height-130), cols: [{width: 47}, {width: 6}, {width: 47}], padding: 0}) do |on|
        on.col_0 do
          product_heading(@object)

          # Feature/Cover Image
          feature_image
          function_icons(@object.function_icon_paths)

          grid_list(@object.short_details)
        end

        on.col_2 do
          # Features
          @object.features.each do |heading, description|
            subheading heading.upcase
            paragraph description
          end

          move_down 220

          #Image attachments
          product_image if @object.object.image_attachments.count > 1
        end
      end
    end

    def page_2
      move_down 70
      build_columns({ height: (bounds.height-130), cols: [{width: 47}, {width: 6}, {width: 47}], padding: 0}) do |on|
        on.col_0 do
          product_heading(@object)

          grid_list(@object.long_details)

          move_down 20

          details_box "SUPPLIED ACCESSORIES", @object.supplied_accessories unless @object.supplied_accessories.blank?
          details_box "OPTIONAL ACCESSORIES", @object.optional_accessories unless @object.optional_accessories.blank?
        end

        on.col_2 do
          # Schematics Image
          image upload_url(@object.schematics_image_path), at: [0, 256], height: 256, width: bounds.width if @object.schematics_image_path.present?
        end
      end
    end

    def page_3
      move_down 70
      image upload_url(@object.schematics_image_path), at: [bounds.width-(bounds.width*0.7), 360+40], height: 360, width: (bounds.width*0.8) if @object.schematics_image_path.present?

      build_columns({ height: ((bounds.height)-130), cols: [{width: 47}, {width: 6}, {width: 47}], padding: 0}) do |on|
        on.col_0 do
          feature_image

          product_heading(@object)

          break_line opts={ color: GREY, padding: 10, width: 515.28 }

          grid_list(@object.mini_details)

          move_down 20
        end
      end

    end

  private

    def product_image
      size = (bounds.width*0.9)
      bounding_box([0, cursor], width: size, height: size) do
        debug_stroke_bounds
        image upload_url(@object.product_image_path), at: [0, cursor], height: (bounds.width), width: bounds.width if @object.product_image_path.present?
      end
      move_down 10
    end

    def feature_image
      size = (bounds.width*0.9)
      bounding_box([0, cursor], width: size, height: size) do
        debug_stroke_bounds
        image upload_url(@object.cover_image_path), at: [0, cursor], height: (bounds.width) if @object.cover_image_path.present?
      end
      move_down 10
    end

    def function_icons icon_paths
      icon_width  = 34.5
      icon_height = 41

      debug_stroke_bounds
      icon_paths.in_groups_of(6, nil) do |group|
        x = 0
        y = cursor

        group.each do |icon_path|
          bounding_box([x, y], width: icon_width, height: icon_height) do
            image image_url(icon_path), fit: [icon_width, icon_height] if icon_path.present? rescue next
          end
          x += icon_width+2
        end
        move_down 6
      end

      move_down 10
    end

  end
end
