# frozen_string_literal: true

require './day1/runner'
require './day2/runner'

def advent_of_code
  puts Day1.new.result
  puts Day2.new.result
end

advent_of_code
