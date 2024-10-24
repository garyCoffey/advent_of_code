# frozen_string_literal: true

(1..1).to_a.each { |day| require "./advent/2023/day#{day}/runner" }

def advent_of_code
  classes = [Trebuchet.new]
  classes.each do |class_obj| 
    puts class_obj.part_1_result
    puts class_obj.part_2_result
  end
end

advent_of_code
