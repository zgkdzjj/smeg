module Options
  class Programs < Base

    class Types < Roles

      def initialize(option)
        @option = option
      end

      @options = %w(
                  soak
                  normal_eco
                  eco
                  auto_60_70
                  intensive_65
                  ultraclean
                  pro_glasses
                  ultra_rapid
                  universal
                  intensive
                  super

                  synthetics
                  shirts
                  blankets
                  delicates
                  hand_wash
                  steam_referesh
                  rinse
                  spin_drain_auto_program
                  cottons
                  cottons_eco
                  hygenic_heavy_duty
                  full_load_quick
                  small_load_14
                  wool
                  sports_and_outdoor
                  jeans
                  daily
                  wool_refresh
                  sportswear
                  baby_protect
                  time_programmes_cotton_iron_dry
                  cotton_cupboard_dry
                  cotton_extra_dry
                  synthetics_iron_dry
                  synthetics_cupboard_dry
                  mix
                  refresh
                  shirts_30
                )

      def to_s
        I18n.t @option, scope: [:options, :program_list]
      end

    end
  end
end
