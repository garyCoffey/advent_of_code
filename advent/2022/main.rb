# frozen_string_literal: true

(1..5).to_a.each { |day| require "./advent/day#{day}/runner" }

def advent_of_code
  classes = [Day1.new, Day2.new, RuckSack.new, CleaningSections.new, CraneOperator.new]
  classes.each { |class_obj| puts class_obj.result }
end

advent_of_code
