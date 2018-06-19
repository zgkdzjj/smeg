module Options
  class Base
    class << self
      attr_accessor :options

      def all
        @options
      end

      def all_as_sym
        @options.map(&:to_sym)
      end

      # Converts it to an array of arrays
      # [0]
      #   [0] 'tradesperson_assistant'
      #   [1] 'Tradesperson's Assistant'
      #
      def all_as_select
        @options.map { |x| [x, self.new(x).try(:to_s)] }
      end

      # Converts it for use in a select form
      #
      def select_form
        @options.map { |x| [self.new(x).try(:to_s), x] }
      end

      # Converts it for use in a select form
      #
      def all_as_object
        @options.map { |x| { label: self.new(x).try(:to_s), key: x } }
      end
    end
  end
end
