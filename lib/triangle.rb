class Triangle
  # write code here

  attr_accessor :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate
    if @side1 == @side2 && @side3 == @side2
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  def validate_side
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    @side1 + @side2 > @side3 && @side1 + @side3 > @side2 && @side2 + @side3 > @side1
  end

  def validate
    raise TriangleError unless validate_side && valid_triangle_inequality?
  end

  class TriangleError < StandardError 
  end

end
