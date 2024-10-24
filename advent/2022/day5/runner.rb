# frozen_string_literal: true

require './advent/utils'

# CraneOperator runs code for advent day5
class CraneOperator
  DATAFILEPATH = './advent/day5/data/input.txt'

  include UTILILITIES

  def initialize
    @data ||= clean_data(data: get_data(file_path: DATAFILEPATH))
  end

  private

  def print_part1
    "Part1: crates on top row are #{top_row_crates(crane_model: 9000)}"
  end

  def print_part2
    "Part2: the count of overlap is #{top_row_crates(crane_model: 9001)}"
  end

  def top_row_crates(crane_model:)
    supplies = move_creates(crane_model: crane_model)
    # require 'pry'; binding.pry
    supplies.top_row
  end

  def move_creates(crane_model:)
    supply_data = {
      crates: @data[:crate_data][:crates].map(&:clone),
      columns: @data[:crate_data][:columns].clone
    }
    supplies = Supplies.new(supply_data: supply_data, crane_model: crane_model)
    @data[:commands].each { |command| supplies.move(command: command) }
    # require 'pry'; binding.pry
    supplies
  end

  def clean_data(data:)
    @clean_data ||= {}
    half_point = data.index("\n")
    crates = data.slice(0...half_point)
    commands = data.slice((half_point + 1)...data.length)
    @clean_data[:crate_data] = {
      columns: crates.pop.split.length,
      crates: crates.each(&:chars)
    }
    commands.map! { |com| com.delete("\n") }
    commands.map! do |com|
      digits = com.gsub(/[^\d]/, ' ').split
      {
        amount: digits[0].to_i,
        from: digits[1].to_i,
        to: digits[2].to_i
      }
    end
    @clean_data[:commands] = commands
    @clean_data 
  end

  class Supplies
    def initialize(supply_data:, crane_model:)
      @cran_model = crane_model
      @supply_data = supply_data
      clean_data
      @columns = columns(supply: @supply_data[:crates].map(&:clone))
      @rows = @supply_data[:crates].map(&:clone)
    end

    def top_row
      top_of_stacks = []
      @columns.each do |col|
        top_index = col.index { |x| !x.nil? }
        item = top_index.nil? ? "" : col[top_index] 
        top_of_stacks << item
      end
      top_of_stacks.join
    end

    def move_columns(command:)
      first_non_nil_in_from = @columns[command[:from].to_i - 1].index { |x| !x.nil? }
      first_non_nil_in_to = @columns[command[:to].to_i - 1].index { |x| !x.nil? }
      space = @columns[command[:from].to_i - 1][first_non_nil_in_from]
      @columns[command[:from].to_i - 1][first_non_nil_in_from] = nil
      if first_non_nil_in_to.nil?
        @columns[command[:to].to_i - 1][@columns[command[:to].to_i - 1].length - 1] = space
      elsif first_non_nil_in_to.zero?
        @columns[command[:to].to_i - 1].unshift(space)
      else 
        @columns[command[:to].to_i - 1][first_non_nil_in_to - 1] = space
      end
    end

    def move_rows(command:)
      from_row = @rows.index { |row| !row[command[:from] - 1 ].nil? }
      to_row = @rows.index { |row| !row[command[:to] - 1 ].nil? } 
      space = @rows[from_row][command[:from] - 1]
      @rows[from_row][command[:from] - 1] = nil
      if to_row.nil?
        @rows.last[command[:to] - 1] = space
      elsif to_row.zero?
        new_row = Array.new(@columns.length)
        new_row[command[:to] - 1] = space
        @rows.unshift(new_row)
      else
        to_row -= 1
        @rows[to_row][command[:to] - 1] = space
      end
    end

    def move_column_n_times(command:)
      # require 'pry'; binding.pry
      first_non_nil_in_from = @columns[command[:from].to_i - 1].index { |x| !x.nil? }
      first_non_nil_in_to = @columns[command[:to].to_i - 1].index { |x| !x.nil? }
      ending = command[:amount] + first_non_nil_in_from
      spaces = @columns[command[:from].to_i - 1][first_non_nil_in_from..ending]
      @columns[command[:from].to_i - 1][first_non_nil_in_from..ending].each_with_index do |l, i|
        @columns[command[:from].to_i - 1][i] = nil
      end
      while space = spaces.shift
        # require 'pry'; binding.pry
        first_non_nil_in_to = @columns[command[:to].to_i - 1].index { |x| !x.nil? }
        if first_non_nil_in_to.nil?
          @columns[command[:to].to_i - 1][@columns[command[:to].to_i - 1].length - 1] = space
          # require 'pry'; binding.pry
        elsif first_non_nil_in_to.zero?
          @columns[command[:to].to_i - 1].unshift(space)
          # require 'pry'; binding.pry
        else 
          @columns[command[:to].to_i - 1][first_non_nil_in_to - 1] = space
          # require 'pry'; binding.pry
        end
      end
    end

    def move(command:)
      p command
      if @cran_model == 9000 || command[:amount] == 1
        command[:amount].times do 
          move_columns(command: command)
          move_rows(command: command)
        end
      else
        move_column_n_times(command: command)
        # move_row_n_times(command: command)
      end
      # require 'pry';binding.pry
    end

    def columns(supply:)
      cols = []
      @supply_data[:columns].times do
        new_row = []
        supply.each do |row|
          new_row << row.shift
        end
        cols << new_row
      end
      cols
    end

    def clean_space(space:)
      return nil if space.strip == ""

      space[1]
    end

    def clean_data
      @supply_data[:crates].map! do |row|
        new_row = []
        while !row.empty?
          new_row << clean_space(space: row.slice!(0..3))
        end
        new_row
      end
    end
  end
end
