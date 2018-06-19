module Options
  class Aesthetics < Base

    def initialize(option)
      @option = option
    end

    @options = %w(
                portofino
                classic
                linear
                victoria
              )

    def to_s
      I18n.t @option, scope: [:options, :aesthetics]
    end

  end
end
