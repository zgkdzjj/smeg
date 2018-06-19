module Options
  class Functions < Base

    class Types < Roles

      def initialize(option)
        @option = option
      end

      @options = %w(
                  pyrolytic_cleaning
                  eco_pyrolytic
                  pyrolytic
                  defrost_proofing_dehydrate_warming
                  static_grill
                  convection
                  fan_forced
                  fan_grill
                  fan_assisted
                  bakers_function
                  supercook
                  eco
                  microwave
                  microwave_grill
                  microwave_fan_forced
                  microwave_static_fan
                  vapour_clean
                  defrost_by_time
                  defrost_by_weight
                  proving
                  sabbath_mode
                  keep_warm
                  reheat
                  steam
                  base_heat
                  bakers_microwave
                  fan_forced_grill
                  half_grill
                  super_fan_force
                  fan_forced_steam
                  fan_assisted_gas
                  rotisserie
                  grill_element
                  rotisserie_full
                  half_static_grill
                  pizza
                  quicktime
                  flexizone
                  delay
                  flexitab
                  enersave
                  aquatest
                  orbital_system
                  eco_fan_forced
                  meat
                  vegetables
                  pasta
                  cake
                  potato
                  fish
                  beverage
                  popcorn
                  chicken
                  frozen_pizza
                  frozen_vegetables
                  fresh_vegetables
                  dish_warmer
                  cake_bread
                  fresh_pizaa
                  fresh_gratin
                  frozen_gratin
                  combination
                  defrost_proofing_dehydrate_warming

                  fully_automatic_coffee_preparation
                  automatic_cappuccino_maker
                  ground_coffee_option
                  hot_water_function
                  rinsing_function
                  steam_function
                  automatic_milk_frother

                  prewash
                  quick_rinse
                  extra_rinse
                  memory
                  dryness_adjustment_level
                )

      def to_s
        I18n.t @option, scope: [:options, :function_list]
      end

    end
  end
end
