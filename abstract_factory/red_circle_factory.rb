require_relative "abstract_factory"
require_relative "circle"
require_relative "red"

class RedCircleFactory < AbstractFactory
  def self.build_shape(*args)
    Circle.new(*args)
  end

  def self.build_color(*args)
    Red.new(*args)
  end
end
