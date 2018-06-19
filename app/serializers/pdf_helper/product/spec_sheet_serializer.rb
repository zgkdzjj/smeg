class PdfHelper::Product::SpecSheetSerializer < PdfHelper::Base
  include ActionView::Helpers::NumberHelper

  attributes :model_number,
             :description

  def model_number
    object.model_number
  end

  def description
    object.description
  end

  # If replacing to a stored path, remove image_url() helper from the PDF
  def product_image_path
    object.image_attachments.try(:last).try(:attachment)
  end

  # If replacing to a stored path, remove image_url() helper from the PDF
  def cover_image_path
    object.cover_image
  end

  # If replacing to a stored path, remove image_url() helper from the PDF
  def schematics_image_path
    object.schematic_attachments.try(:first).try(:attachment)
  end

  # If replacing to a stored path, remove image_url() helper from the PDF
  def function_icon_paths
    paths = []

    object.function_list.each do |function|
      next if function.blank?
      paths << function_icon(function)
    end

    return paths
  end

  def function_icon function
    return "products/function_icons/#{function.humanize}.jpg"
  end

  # Need to restrict size so we don't go over the feature image
  def features
    features = []

    object.features.each do |feature|
      features << [feature.name, feature.long_description]
    end

    return features
  end

  def mini_details
    fields = ["dimensions", "power", "warranty"]
    arr    = []

    fields.each do |field|
      value = self.object.send(field) if self.object.attributes.include?(field)
      next if value.blank?

      arr << [
        "#{I18n.t field, scope: [:products, :paper_trail]}", value
      ]
    end

    return arr
  end

  def short_details
    fields = ["dimensions", "finish", "total_functions", "display", "capacity", "power", "warranty", "ean"]
    arr    = []

    fields.each do |field|
      value = self.object.send(field) if self.object.attributes.include?(field)
      next if value.blank?

      arr << [
        "#{I18n.t field, scope: [:products, :paper_trail]}", value
      ]
    end

    return arr
  end

  def long_details
    fields = [
               "dimensions", "finish", "total_functions", "display", "capacity", "cooking_levels", "thermostat",
               "installation", "programmability", "cleaning", "lighting", "safety", "power", "warranty", "ean"
             ]
    arr = []

    fields.each do |field|
      value = self.object.send(field) if self.object.attributes.include?(field)
      next if value.blank?

      arr << [
        "#{I18n.t field, scope: [:products, :paper_trail]}", value
      ]
    end

    return arr
  end

  def supplied_accessories
    self.object.supplied_accessories.try(:map) { |x| x }.reject { |x| x.blank? }
  end

  def optional_accessories
    self.object.optional_accessories.try(:map) { |x| x }.reject { |x| x.blank? }
  end

end
