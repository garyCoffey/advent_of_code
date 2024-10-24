# frozen_string_literal: true

# RuckSack runs code for advent day3
class RuckSack
  def result
    "#{print_part1} \n#{print_part2}"
  end

  private

  def print_part1
    "Part1: the score of items in rucksack is #{part1_result}"
  end

  def print_part2
    "Part2: the score of items in rucksack is #{part2_result}"
  end

  def part1_result
    score_items(part: 1)
  end

  def part2_result
    score_items(part: 2)
  end

  def file_path
    './advent/day3/data/input.txt'
  end

  def find_item_score(item:)
    score = ('a'..'z').to_a + ('A'..'Z').to_a
    score.find_index(item) + 1
  end

  def find_duplicate_item(compartments:)
    tracker = {}
    compartments.first.each do |item|
      tracker[item] = [0]
    end
    compartments.each_with_index do |compartment, i|
      next if i.zero?

      compartment.each do |item|
        tracker[item] << i if tracker[item] && !tracker[item].include?(i)
      end
    end
    tracker.max_by { |_k, v| v.length }
  end

  def get_compartments(rucksack:)
    [rucksack[0...(rucksack.length / 2)], rucksack[(rucksack.length / 2)...(rucksack.length)]]
  end

  def process_part1(data:)
    score = 0
    data.each do |rucksack|
      rucksack = rucksack.strip.chars
      compartments = get_compartments(rucksack: rucksack)
      duplicate_item = find_duplicate_item(compartments: compartments).first
      score += find_item_score(item: duplicate_item)
    end
    score
  end

  def process_part2(data:)
    score = 0
    until data.empty?
      compartments = data.shift(3).map { |raw| raw.strip.chars }
      duplicate_item = find_duplicate_item(compartments: compartments).first
      score += find_item_score(item: duplicate_item)
    end
    score
  end

  def score_items(part:)
    data = File.readlines(file_path)
    part == 1 ? process_part1(data: data) : process_part2(data: data)
  end
end
