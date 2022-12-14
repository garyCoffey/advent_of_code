# frozen_string_literal: true

# Day1 runs code for advent day1
class Day1
  def result
    [
      "The most calories being carried by an elf is: #{most_calories_being_carried_n_elves(n_elves: 1)}",
      "The most calories being carried by the top 3 elves is: #{most_calories_being_carried_n_elves(n_elves: 3)}"
    ].join("\n")
  end

  private

  def file_path
    './advent/day1/data/data.txt'
  end

  def new_elf?(line:)
    line == "\n"
  end

  def count_calories
    calories_for_elves = [0]
    current_index = 0
    File.foreach(file_path) do |line|
      if new_elf?(line: line)
        current_index += 1
        calories_for_elves[current_index] = 0
      else
        calories_for_elves[current_index] += line.to_i
      end
    end
    calories_for_elves
  end

  def most_calories_being_carried_n_elves(n_elves:)
    calories_for_elves = count_calories
    calories_for_elves.sort[-n_elves...calories_for_elves.count].sum
  end
end
