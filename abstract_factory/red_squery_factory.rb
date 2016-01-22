require_relative "abstract_factory"
require_relative "squery"
require_relative "red"

class RedSqueryFactory < AbstractFactory
  def self.build_shape(*args)
    Squery.new(*args)
  end

  def self.build_color(*args)
    Red.new(*args)
  end
end
