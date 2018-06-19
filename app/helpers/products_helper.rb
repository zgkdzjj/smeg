module ProductsHelper

  def function_icon function
    return "/pdf/images/products/function_icons/#{function.humanize.downcase}.jpg"
  end

  def supplied_accessories product
    return if product.supplied_accessories.nil?
    product.supplied_accessories.try(:map) { |x| x }.reject { |x| x.blank? }
  end

  def optional_accessories product
    return if product.optional_accessories.nil?
    product.optional_accessories.try(:map) { |x| x }.reject { |x| x.blank? }
  end

  def dynamic_list list
    return if list.nil?
    list.try(:map) { |x| x }.reject { |x| x.blank? }
  end

end