require_relative "abstract_factory"
require_relative "triangle"
require_relative "green"

class GreenTriangleFactory < AbstractFactory
  def self.build_shape(*args)
    Triangle.new(*args)
  end

  def self.build_color(*args)
    Green.new(*args)
  end
end
