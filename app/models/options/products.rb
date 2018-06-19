module Options
  class Products < Base

    class Types < Roles

      def initialize(option)
        @option = option
      end

      @options = %w(
                  CeramicElectricCooktop
                  ClassicCoffeeMachine
                  ClassicCompact
                  ClassicDoubleOven
                  ClassicOven70
                  ClassicOven76
                  ClassicOven90
                  ClassicOvenMidrange
                  Dishwasher
                  DominoCooktop
                  FabRefrigeration
                  FreestandingCooker70
                  FreestandingCooker90
                  FreestandingCooker120
                  FreestandingCooker150
                  FrenchDoorRefrigeration
                  GasCooktop
                  WashingMachine
                  Dryer
                  InductionCooktop
                  LinearCompact
                  LinearOven
                  LinearRangehood
                  Microwave
                  UndermountRangehood
                  VictoriaCompact
                  VictoriaDoubleOven
                  VictoriaFreestandingCooker90
                  VictoriaFreestandingCooker93
                  VictoriaFreestandingCooker110
                  PortofinoFreestandingCooker90
                  VictoriaOven
                  VictoriaRangehood
                  PortofinoRangehood
                  WallmountRangehood
                  WarmingDrawer
                  GasInductionDominoCooktop
                )

      def to_s
        I18n.t @option, scope: [:options, :product_types]
      end

    end
  end
end
