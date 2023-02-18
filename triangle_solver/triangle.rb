# TODO: not finished, also need to refactor the order of arguments for methods

class TriangleCalculator
  attr_accessor :side_a, :side_b, :side_c, :angle_a, :angle_b, :angle_c

  def initialize(side_a, side_b, side_c, angle_a, angle_b, angle_c)
    self.side_a = side_a
    self.side_b = side_b
    self.side_c = side_c
    self.angle_a = angle_a
    self.angle_b = angle_b
    self.angle_c = angle_c
  end

  def calculate
    puts "a: #{side_a}, b: #{side_b}, c: #{side_c}, A: #{angle_a}, B: #{angle_b}, C: #{angle_c}"
    # logic to determine which solve method to call
  end

  private

  def solve_aas_asa # aas and asa follow the same algorithm
    # Algorithm:
    # 1. angles of triangle to find missing angle
    # 2. law of sines to find a missing side
    # 3. law of sines to find last side

    # 1
    if angle_a.blank?
      angle_a = angles_of_a_triangle(angle_b, angle_c)
    elsif angle_b.blank?
      angle_b = angles_of_a_triangle(angle_a, angle_c)
    else # angle c is blank
      angle_c = angles_of_a_triangle(angle_a, angle_b)
    end

    # 2 - 3
    if side_a.present?
      side_b = law_of_sines_solve_for_side(angle_a, angle_b, side_a)
      side_c = law_of_sines_solve_for_side(angle_a, angle_c, side_a)
    elsif side_b.present?
      side_a = law_of_sines_solve_for_side(angle_b, angle_a, side_b)
      side_c = law_of_sines_solve_for_side(angle_b, angle_c, side_b)
    else # side_c is present
      side_b = law_of_sines_solve_for_side(angle_c, angle_a, side_c)
      side_c = law_of_sines_solve_for_side(angle_c, angle_b, side_c)
    end
  end

  def solve_two_side_triangle
    # two sided triangles are solved differently depending on the known angle
    # if the known angle is not included (is not between the known sides), we solve a ssa triangle
    # if the known angle is included (is between the known sides), we solve a sas triangle

    # logic to determine sas or ssa
    if angle_a.present?
      if side_a.present?
        # solve ssa
      else
        # solve sas
      end
    elsif angle_b.present?
      if side_b.present?
        # solve ssa
      else
        # solve sas
      end
    else # angle_c is present
      if side_c.present?
        # solve ssa
      else
        # solve ssa
      end
    end
  end

  def solve_sas
    # Algorithm:
    # 1. cosines to find the missing side
    # 2. sines to find a missing angle
    # 3. angles of a triangle to find last angle

    # 1 - 2 - 3 -> we can do all algorithm steps once we know which side is missing
    if side_a.blank?
      side_a = law_of_cosines_solve_for_side(angle_a, side_b, side_c)
      angle_b = law_of_sines_solve_for_angle(angle_a, side_a, side_b)
      angle_c = angles_of_a_triangle(angle_a, angle_b)
    elsif sibe_b.blank?
      side_b = law_of_cosines_solve_for_side(angle_b, side_a, side_c)
      angle_a = law_of_sines_solve_for_angle(angle_b, side_b, side_a)
      angle_c = angles_of_a_triangle(angle_a, angle_b)
    else # side_c is blank
      side_c = law_of_cosines_solve_for_side(angle_c, side_a, side_b)
      angle_a = law_of_sines_solve_for_angle(angle_c, side_c, side_a)
      angle_b = angles_of_a_triangle(angle_a, angle_c)
    end
  end

  def solve_ssa
    # Algorithm:
    # 1. sines to find a missing angle
    # 2. angles of a triangle to find last angle
    # 3. sines to find last side

    # 1 - 2 - 3 -> we can do all algorithm steps once we know which side is missing
    # and which angle is known
    if side_a.blank?
      if angle_b.blank? # we know angle_c
        angle_b = law_of_sines_solve_for_angle(angle_c, side_c, side_b)
      else # angle_c is blank, we know angle_b
        angle_c = law_of_sines_solve_for_angle(angle_b, side_b, side_c)
      end
      angle_a = angles_of_a_triangle(angle_b, angle_c)
      side_a = law_of_sines_solve_for_side(angle_b, angle_a, side_b)
    elsif side_b.blank?
      if angle_a.blank? # we know angle_c
        angle_a = law_of_sines_solve_for_angle(angle_c, side_c, side_a)
      else # angle_c is blank, we know angle_a
        angle_c = law_of_sines_solve_for_angle(angle_a, side_a, side_c)
      end
      angle_b = angles_of_a_triangle(angle_a, angle_c)
      side_b = law_of_sines_solve_for_side(angle_a, angle_b, side_a)
    else # side_c is blank
      if angle_a.blank? # we know angle_b
        angle_a = law_of_sines_solve_for_angle(angle_b, side_b, side_a)
      else # angle_b is blank, we know angle_a
        angle_b = law_of_sines_solve_for_angle(angle_a, side_a, side_b)
      end
      angle_c = angles_of_a_triangle(angle_a, angle_b)
      side_c = law_of_sines_solve_for_side(angle_a, angle_c, side_a)
    end
  end

  def solve_sss
    # Algorithm:
    # 1. cosines to find any one of the angles
    # 2. sines to find second angle
    # 3. angles of triangle to find third angle

    # 1
    angle_a = law_of_cosines_solve_for_angle(side_a, side_b, side_c)

    # 2
    angle_b = law_of_sines_solve_for_angle(angle_a, side_a, side_b)

    # 3
    angle_c = angles_of_a_triangle(angle_a, angle_b)
  end

  def law_of_sines_solve_for_side(angle_1, angle_2, side_1)
    # return side_2
  end

  def law_of_sines_solve_for_angle(angle_1, side_1, side_2)
    # return angle_2
  end

  def law_of_cosines_solve_for_side(angle_1, side_1, side_2)
    # return side_3
  end

  def law_of_cosines_solve_for_angle(side_1, side_2, side_3)
    # return angle_1
  end

  def angles_of_a_triangle(angle_1, angle_2)
    # return angle_3
  end

end

###################################################################################################

puts "Welcome to the Triangle Calculator 3000!"
puts "Would you like me to calculate a triangle for you? (y/n)"

start = gets.chomp
puts "\n"

unless start == "y"
  puts "Ok, maybe next time!"
  return
end

puts "Awesome!"

confirmed = false

while confirmed == false
  puts "Enter value for side a (leave blank if unknown)"
  side_a = gets.chomp
  puts "\n"

  puts "Enter value for side b (leave blank if unknown)"
  side_b = gets.chomp
  puts "\n"

  puts "Enter value for side c (leave blank if unknown)"
  side_c = gets.chomp
  puts "\n"

  puts "Enter value for angle A (leave blank if unknown)"
  angle_a = gets.chomp
  puts "\n"

  puts "Enter value for angle B (leave blank if unknown)"
  angle_b = gets.chomp
  puts "\n"

  puts "Enter value for angle C (leave blank if unknown)"
  angle_c = gets.chomp
  puts "\n"

  puts "You entered:"
  puts "sides"
  puts "a: #{side_a}"
  puts "b: #{side_b}"
  puts "c: #{side_c}"
  puts "angles"
  puts "A: #{angle_a}"
  puts "B: #{angle_b}"
  puts "C: #{angle_c}"
  puts "Is that correct? (y/n)"
  user_confirmed = gets.chomp
  puts "\n"

  if user_confirmed == "n"
    confirmed == false
    puts "OK, let's try again."
  else
    confirmed = true
  end
end

puts "OK! Let me work my magic! :)"

::TriangleCalculator.new(side_a, side_b, side_c, angle_a, angle_b, angle_c).calculate
