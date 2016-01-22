require_relative "abstract_factory"
require_relative "squery"
require_relative "green"

class GreenSqueryFactory < AbstractFactory
  def self.build_shape(*args)
    Squery.new(*args)
  end

  def self.build_color(*args)
    Green.new(*args)
  end
end
