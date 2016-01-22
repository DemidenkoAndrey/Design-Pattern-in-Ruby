require_relative "green_circle_factory"
require_relative "green_squery_factory"
require_relative "green_triangle_factory"
require_relative "red_circle_factory"
require_relative "red_squery_factory"
require_relative "red_triangle_factory"

class ColoredShapeFactory
  TYPES = %w(
    GreenCircle
    GreenRectangle
    GreenSquery
    GreenTriangle
    RedCircle
    RedRectangle
    RedSquery
    RedRectangle
  )
  def self.get_factory(factory_type)
    if TYPES.include? factory_type
      self.class.const_get("#{factory_type}Factory").new
    else
      nil
    end
  end
end
