# frozen_string_literal: true

require './advent/day1/runner'
require './advent/day2/runner'
require './advent/day3/runner'
require './advent/day4/runner'

def advent_of_code
  classes = [Day1.new, Day2.new, RuckSack.new, CleaningSections.new]
  classes.each { |class_obj| puts class_obj.result }
end

advent_of_code
