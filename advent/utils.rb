# frozen_string_literal: true

# UTILILITIES contains code that may be used by all days of code to deduplicate the code
module UTILILITIES
  def result
    "#{print_part1} \n#{print_part2}"
  end

  def get_data(file_path:)
    File.readlines(file_path)
  end
end
