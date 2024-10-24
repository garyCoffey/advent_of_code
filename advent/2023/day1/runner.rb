
# Day1 runs code for advent day1
class Trebuchet
  def part_1_result
    "The sum of all calibration values is: #{sum_of_calibration_values}"
  end

  def part_2_result
    "The sum of all calibration values is: #{sum_of_calibration_values_part_2}"
  end

  private

  def file_path
    './advent/2023/day1/data/data.txt'
  end

  def sum_of_calibration_values
    File.foreach(file_path).reduce(0) do |count, line|
      digits = line.scan(/\d/)
      count + (digits[0] + digits[-1]).to_i
    end
  end

  def sum_of_calibration_values_part_2
    File.foreach(file_path).reduce(0) do |count, line|
      p line 
      x = map_words_to_digits(line: line)
      p x
      digits = x.scan(/\d/)
      p digits
      count + (digits[0] + digits[-1]).to_i
    end
  end

  def word_values
    {
      'one' => 1,
      'two' => 2,
      'three' => 3,
      'four' => 4,
      'five' => 5,
      'six' => 6,
      'seven' => 7,
      'eight' => 8,
      'nine' => 9,
    }
  end

  def map_words_to_digits(line:)
    word_values.each do |word, digit|
      line.gsub!(/\b#{word}\b/, digit.to_s)
    end
    line
  end
end
