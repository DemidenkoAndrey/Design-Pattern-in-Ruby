require_relative "abstract_factory"
require_relative "circle"
require_relative "green"

class GreenCircleFactory < AbstractFactory
  def self.build_shape(*args)
    Circle.new(*args)
  end

  def self.build_color(*args)
    Green.new(*args)
  end
end
