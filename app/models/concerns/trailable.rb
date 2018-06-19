module Trailable
  extend ActiveSupport::Concern

  def papertrail_history
    versions.map{|version| version_hash(version)}
  end

  def version_hash(version)
    {
      date: version.created_at,
      whodunnit: User.find_by(id: version.whodunnit),
      event: version.event,
      text: version_text(version)
    }
  end

private

  def version_text(version)
    if version.event == 'create'
      "#{self.slug} was created."

    elsif version.event == 'update'
      title = "#{self.slug} was updated:</br>"
      [title, build_change_description(version)].join(" ")

    elsif version.event == 'destroy'
      "#{self.slug} was deleted."
    else
      version.event
    end
  end

  def build_change_description version
    version.changeset.map do |k, v|

      next if skip_validation(v) || skip_value(k)
      next if k == 'data'

      if k == 'function_list'
        build_label_for_functions_list(translation(k), v[0], v[1])
      elsif array_field(k)
        build_label_for_array_field(translation(k), v[0], v[1])
      else
        build_label_for_change(translation(k), v[0], v[1])
      end

    end.compact.join(' ')
  end

  def build_label_for_array_field label, v0, v1
    v0 = v0.reject { |x| x.empty? }
    v1 = v1.reject { |x| x.empty? }

    if v0.present? && v1.blank?
      "<b>#{label}</b> has been cleared from #{(v0).join(', ')}.<br/>"
    elsif v0.blank? && v1.present?
      "<b>#{label}</b> has been set to #{(v1).join(', ')}.<br/>"
    else
      "<b>#{label}</b> was updated from #{(v0).join(', ')} to #{(v1).join(', ')}.<br/>"
    end
  end

  def build_label_for_functions_list label, v0, v1
    v0 = v0.reject { |x| x.empty? }
    v1 = v1.reject { |x| x.empty? }

    if v0.blank? && v1.blank?
      "<b>#{label}</b> has been cleared.<br/>"
    elsif v0.blank?
      "<b>#{label}</b> has been set to #{translate(v1)}.<br/>"
    else
      v1.blank? ? "<b>#{label}</b> has been cleared from #{translate(v0)}.<br/>" : "<b>#{label}</b> was updated from #{translate(v0)} to #{translate(v1)}.<br/>"
    end
  end

  def build_label_for_change label, v0, v1
    if v0.blank? && v1.blank?
      "<b>#{label}</b> has been cleared.<br/>"
    elsif v0.blank?
      "<b>#{label}</b> has been set to #{v1}.<br/>"
    else
      v1.blank? ? "<b>#{label}</b> has been cleared from #{v0}.<br/>" : "<b>#{label}</b> was updated from #{v0} to #{v1}.<br/>"
    end
  end

  def translate value
    return value.map { |x| I18n.t("options.function_list.#{x}")  }.join(", ")
  end

  def translation key
    I18n.t("products.paper_trail.#{key}")
  end

  def skip_validation value
    return (value[0].blank? && value[1].blank?)
    return false
  end

  # this is the list of keys that we don't want to show on the history.
  # we want to show just the last one.
  def skip_value value
    %w(
      type
      updated_at
      created_at
    ).include? value
  end

  def array_field value
    %w(
      finish
      safety
      supplied_accessories_cooker
      features
      supplied_accessories
      optional_accessories
      function_list
      programmability
      quick_programs_list
      programs_list
      gross_capacity
      shelves_main_compartment
      drawers_main_compartment
      shelves_inner_door
      accessories_inner_door
      shelves_freezer
      drawers_freezer
      accessories_freezer
      programmability_oven_left
      programmability_oven_right
      supplied_accessories_oven_left
      supplied_accessories_oven_right
      supplied_accessories_main_oven
      door_shelves_main_compartment
      accessories_main_compartment
      door_shelves_freezer
      auxiliary_list
      other_functions
      programmability_main_oven
      programmability_oven_left
      programmability_grill
      supplied_accessories_grill
    ).include? value
  end

end