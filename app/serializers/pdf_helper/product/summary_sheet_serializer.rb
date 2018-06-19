class PdfHelper::Product::SummarySheetSerializer < PdfHelper::Base
  include ActionView::Helpers::NumberHelper

  attributes :model_number,
             :description

  def model_number
    object.model_number
  end

  def description
    "#{object.description}
    #{I18n.t object.type, scope: [:options, :product_types]}
    "
  end

  def product_brand_label
    case object.aesthetic
    when "portofino"
      return "logos/PortofinoBySmeg (White).png"
    when "classic"
      return "logos/ClassicBySmeg (White).png"
    when "linear"
      return "logos/LinearBySmeg (White).png"
    when "victoria"
      return "logos/LinearBySmeg (White).png"
    else
      return "logos/ClassicBySmeg (White).png"
    end
  end

  def price_label
    number_to_currency(object.price, strip_insignificant_zeros: true)
  end

  # MAX 5
  def features_list
    features = []

    object.features.each do |feature|
      #need to upcase first for egs like 120l capacity
      features << { title: feature.name.upcase.titlecase, desc: feature.short_description }
    end

    return features
  end

end
