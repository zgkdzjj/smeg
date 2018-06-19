class Proc
  def perform(callable)
    self === Class.new do
      method_name = callable.to_sym
      define_method(method_name) { |&block| block.nil? ? true : block.call }
      define_method("#{method_name}?") { true }
      def method_missing(method_name, *args, &block) false; end
    end.new
  end
end
