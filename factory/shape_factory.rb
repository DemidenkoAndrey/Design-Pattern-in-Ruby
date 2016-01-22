class ShapeFactory
  def self.build(shape, *args)
    case shape
    when :triangle
      Triangle.new(*args)
    when :square
      Square.new(*args)
    when :circle
      Circle.new(*args)
    end
  end
end
