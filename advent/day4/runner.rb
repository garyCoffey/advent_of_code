# frozen_string_literal: true

require './advent/utils'
require 'set'

# CleaningSections runs code for advent day3
class CleaningSections
  DATAFILEPATH = './advent/day4/data/input.txt'

  include UTILILITIES

  def initialize
    @data = clean_data(data: get_data(file_path: DATAFILEPATH))
  end

  private

  def print_part1
    "Part1: count of subsets is #{count_sections(part: 1)}"
  end

  def print_part2
    "Part2: the count of overlap is #{count_sections(part: 2)}"
  end

  def subset?(cleaning_sections:)
    cleaning_sections[0].subset?(cleaning_sections[1]) || cleaning_sections[1].subset?(cleaning_sections[0])
  end

  def overlap?(cleaning_sections:)
    (cleaning_sections[0] & cleaning_sections[1]).length.positive?
  end

  def count_sections(part:)
    overlapping_sections = 0
    @data.each do |datum|
      cleaning_sections = []
      datum.each do |range|
        range = range.split('-')
        cleaning_sections << Set.new(((range.first)..(range.last)).to_a)
      end
      if (part == 1 && subset?(cleaning_sections: cleaning_sections)) ||
         (part == 2 && overlap?(cleaning_sections: cleaning_sections))
        overlapping_sections += 1
      end
    end
    overlapping_sections
  end

  def clean_data(data:)
    data.map! { |datum| datum.delete("\n").split(',') }
  end
end
