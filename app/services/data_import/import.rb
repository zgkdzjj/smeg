module DataImport
  class Import

    def initialize
      @features_path  = "#{Rails.root}/files/features"
      @products_path  = "#{Rails.root}/files/products"

      @product_images = "#{Rails.root}/public/pdf/images/products"
    end

    def import_features
      counter = 0

      Dir.glob(@features_path + "/*.csv").each do |file|
        counter += 1
        puts "Importing Library Files #{counter}/#{Dir.glob(@features_path + "/*.csv").count}"

        File.open(file, "r") do |file|
          @feature_library = SmarterCSV.process(file, convert_values_to_numeric: false, remove_empty_values: false, remove_zero_values: false)
        end

        @feature_library.each do |row|
          feature = Feature.find_or_create_by(name: row[:feature].try(:downcase))
          feature.update_attributes(
            long_description: row[:long_form_40_words],
            short_description: row[:short_forms_10_words]
          )
        end
      end
    end

    def import_products
      counter = 0

      Dir.glob(@products_path + "/*.csv").each do |file|
        counter += 1
        puts "Importing Product Files #{counter}/#{Dir.glob(@products_path + "/*.csv").count}"
        puts "#{File.basename(file)}"

        File.open(file, "r") do |file|
          @products = SmarterCSV.process(file, convert_values_to_numeric: false, remove_empty_values: false, remove_zero_values: false)
        end

        @products.each do |row|
          product = Product.find_or_create_by(model_number: row[:model_number])
          product.update_attributes(product_attributes(row))

          features = []

          features << row[:feature_1] if row[:feature_1].present?
          features << row[:feature_2] if row[:feature_2].present?
          features << row[:feature_3] if row[:feature_3].present?
          features << row[:feature_4] if row[:feature_4].present?
          features << row[:feature_5] if row[:feature_5].present?
          features << row[:feature_6] if row[:feature_6].present?

          features.each do |feature|
            product_feature = Feature.find_or_create_by(name: feature.try(:downcase))
            product.features << product_feature
          end

        end
      end
    end

    def import_images
      schematic_counter = 0
      image_counter     = 0

      Dir.glob(@product_images + "/*.tif").each do |schematic|
        schematic_counter += 1
        puts "Uploading Schematic #{schematic_counter}/#{Dir.glob(@product_images + "/*.tif").count}"

        product = Product.find_by_model_number(/(.+?)_.*/.match(File.basename(schematic))[1]) if /(.+?)_.*/.match(File.basename(schematic)).present?

        next if product.nil?

        product.schematic_attachments.create(attachment: File.open(schematic))
      end

      Dir.glob(@product_images + "/*.jpg").each do |image|
        image_counter += 1
        puts "Uploading Image #{image_counter}/#{Dir.glob(@product_images + "/*.jpg").count}"

        product = Product.find_by_model_number(/(.+?)_.*/.match(File.basename(image))[1]) if /(.+?)_.*/.match(File.basename(image)).present?

        next if product.nil?

        product.image_attachments.create(attachment: File.open(image))

        if /(_+?HR)/.match(File.basename(image)).present?
          product.cover_image = File.open(image)
          product.save
        end
      end
    end

  private

    def product_attributes product
      {
        type: product[:type],
        description: product[:description],
        ean: product[:ean],
        aesthetic: aesthetic_type(product[:aesthetic]),
        status: product_status(product[:status]),
        dimensions: product[:dimensions],
        finish: product[:finish].try(:split, ",") || [],
        safety: product[:safety].try(:split, ",") || [],
        power: product[:power],
        warranty: product[:warranty],
        notes: product[:notes],
        supplied_accessories: product[:supplied_accessories].try(:split, ",") || [],
        optional_accessories: product[:optional_accessories].try(:split, ",") || []
      }.merge!(data_hash(product))
    end

    def data_hash product
      a = {
        data: {}
      }

      product.each do |k, v|
        if [:function_list, :function_list_main_oven, :function_list_aux_oven].include?(k)
          new_hash = {}

          case k
          when :function_list
            new_hash[k] = product[:function_list].split(',').map { |x| x.gsub(" ", "_").underscore }
          when :function_list_main_oven
            new_hash[k] = product[:function_list_main_oven].split(',').map { |x| x.gsub(" ", "_").underscore }
          when :function_list_aux_oven
            new_hash[k] = product[:function_list_aux_oven].split(',').map { |x| x.gsub(" ", "_").underscore }
          end

          a[:data].merge!(new_hash)

        elsif array_fields(k)
          new_hash = {}
          new_hash[k] = v.try(:split, ",") || []

          a[:data].merge!(new_hash)
        elsif string_fields(k)
          new_hash = {}
          new_hash[k] = v

          a[:data].merge!(new_hash)
        else
          next
        end
      end

      return a
    end

    def product_status state
      if ["Active", "Current"].include?(state)
        return true
      else
        return false
      end
    end

    def aesthetic_type aesthetic
      if aesthetic == "Classic"
        return "classic"
      elsif aesthetic == "Portofino"
        return "portofino"
      elsif aesthetic == "Linear"
        return "linear"
      elsif aesthetic == "Victoria"
        return "victoria"
      end
    end

    def array_fields key
      [
        :function_list,
        :capacity,
        :door_glass_main_oven,
        :door_glass_aux_oven,
        :capacity_aux_oven,
        :total_functions_aux_oven,
        :supplied_accessories_aux_oven,
        :programmability_aux_oven,
        :function_list_main_oven,
        :function_list_aux_oven,
        :capacity_main_oven,
        :total_functions_main_oven,
        :programmability_main_oven,
        :supplied_accessories_main_oven,
        :quick_programs_list,
        :programs_list,
        :other_functions,
        :capacity_hob,
        :feature_list,
        :supplied_accessories_hob,
        :programmability_grill,
        :supplied_accessories_grill,
        :gross_capacity,
        :shelves_main_compartment,
        :drawers_main_compartment,
        :lighting_main_compartment,
        :shelves_inner_door,
        :accessories_inner_door,
        :shelves_freezer,
        :drawers_freezer,
        :accessories_freezer,
        :auxiliary_list,
        :features,
        :wash_system,
        :programmability,
        :total_functions,
        :ducting_options,
        :door_shelves_main_compartment,
        :door_shelves_freezer,
        :supplied_accessories_cooker,
        :capacity_gas_hob,
        :safety_gas_hob,
        :supplied_accessories_gas_hob,
        :capacity_electric_hob,
        :safety_electric_hob,
        :supplied_accessories_electric_hob,
        :programmability_oven_left,
        :supplied_accessories_oven_left,
        :programmability_oven_right,
        :supplied_accessories_oven_right,
      ].include?(key)
    end

    def string_fields key
      [
        :style,
        :total_programs,
        :device_display,
        :cooking_levels,
        :thermostat,
        :installation,
        :cleaning,
        :safety_hob,
        :lighting,
        :timers,
        :controls,
        :fascia,
        :drawer,
        :power_supply,
        :pump_pressure,
        :coffee_bean_capacity,
        :water_tank_capacity,
        :microwave_power,
        :auto_menus,
        :door_main_oven,
        :cooking_levels_aux_oven,
        :thermostat_aux_oven,
        :cleaning_aux_oven,
        :lighting_aux_oven,
        :cooking_levels_main_oven,
        :thermostat_main_oven,
        :cleaning_main_oven,
        :lighting_main_oven,
        :size,
        :end_of_cycle_indicator,
        :baskets,
        :water_softener,
        :temperatures,
        :water_connection,
        :timer,
        :filtration,
        :drying,
        :noise,
        :energy_usage,
        :energy_rating,
        :water_usage,
        :water_rating,
        :description_2,
        :max_airflow,
        :motor,
        :hob,
        :lower_left_main_oven,
        :main_oven,
        :door_glass,
        :cavity_type,
        :turntable,
        :power_levels,
        :grill_power,
        :grill,
        :convection_power,
        :auto_cook_functions,
        :control_panel,
        :clock,
        :capacity_grill,
        :total_functions_grill,
        :cooking_levels_grill,
        :thermostat_grill,
        :cleaning_grill,
        :lighting_grill,
        :safety_grill,
        :speeds,
        :delay_stop,
        :defrost,
        :performance,
        :energy_consumption,
        :star_rating,
        :temperature_control,
        :gas_connection,
        :burners,
        :cutout,
        :noise_rating,
        :illumination,
        :drum_construction,
        :door,
        :spin_speed,
        :electrical_input,
        :total_current,
        :weight,
        :ignition,
        :installation_cooker,
        :capacity_cooker,
        :safety_cooker,
        :aux_oven_left,
        :main_oven_left,
        :capacity_oven_left,
        :barbecue,
        :gas_input,
        :door_oven_right,
        :total_functions_oven_left,
        :cooking_levels_oven_left,
        :thermostat_oven_left,
        :cleaning_oven_left,
        :lighting_oven_left,
        :safety_oven_left,
        :aux_oven_right,
        :capacity_oven_right,
        :total_functions_oven_right,
        :cooking_levels_oven_right,
        :thermostat_oven_right,
        :cleaning_oven_right,
        :lighting_oven_right,
        :safety_oven_right,
      ].include?(key)
    end

  end
end