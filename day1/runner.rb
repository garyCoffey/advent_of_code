FILE_PATH = './day1/data.txt'


def new_elf?(line:)
  line == "\n"
end

def count_calories
  calories_for_elves = [0]
  current_index = 0
  File.foreach(FILE_PATH) do |line| 
    if new_elf?(line: line)
      current_index += 1
      calories_for_elves[current_index] = 0
    else
      calories_for_elves[current_index] += line.to_i
    end
  end
  calories_for_elves
end

def most_calories_being_carried_n_elves(n:)
  calories_for_elves = count_calories
  calories_for_elves.sort[-n...calories_for_elves.count].sum
end

def day1_result
  [
    "The most calories being carried by an elf is: #{most_calories_being_carried_n_elves(n: 1)}",
    "The most calories being carried by the top 3 elves is: #{most_calories_being_carried_n_elves(n: 3)}"
  ].join("\n")
end
