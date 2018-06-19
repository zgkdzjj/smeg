module Options
  class QuickPrograms < Base

    class Types < Roles

      def initialize(option)
        @option = option
      end

      @options = %w(
                  rapid_27
                  normal_quick
                  eco_quick
                  daily_quick
                  strong_and_fast
                )

      def to_s
        I18n.t @option, scope: [:options, :quick_program_list]
      end

    end
  end
end
