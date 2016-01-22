require_relative "abstract_factory"
require_relative "triangle"
require_relative "red"

class RedTriangleFactory < AbstractFactory
  def self.build_shape(*args)
    Triangle.new(*args)
  end

  def self.build_color(*args)
    Red.new(*args)
  end
end
