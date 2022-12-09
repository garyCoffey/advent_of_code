# frozen_string_literal: true

# Day2 runs code for advent day1
class Day2
  SCORE_MAP = {
    rock: 1,
    paper: 2,
    scissors: 3,
    win: 6,
    draw: 3,
    lose: 0
  }.freeze

  DECODE_V1 = {
    player1: {
      'A' => :rock,
      'B' => :paper,
      'C' => :scissors
    },
    player2: {
      'X' => :rock,
      'Y' => :paper,
      'Z' => :scissors
    }
  }.freeze

  def result
    "Part1: #{part1_result} \nPart2: #{part2_result}"
  end

  private

  def part1_result
    "The score from following the rock/paper/scissors strategy guide would be: #{game_result(version: 1)}"
  end

  def part2_result
    "The score from following the rock/paper/scissors strategy guide would be: #{game_result(version: 2)}"
  end

  def decode(player1:, player2:, version:); end

  def score_game_v1(player1:, player2:)
    case [player1, player2]
    when %w[A X]
      return SCORE_MAP[:rock] + SCORE_MAP[:draw]
    when %w[A Y]
      return SCORE_MAP[:paper] + SCORE_MAP[:win]
    when %w[A Z]
      return SCORE_MAP[:scissors] + SCORE_MAP[:lose]
    when %w[B X]
      return SCORE_MAP[:rock] + SCORE_MAP[:lose]
    when %w[B Y]
      return SCORE_MAP[:paper] + SCORE_MAP[:draw]
    when %w[B Z]
      return SCORE_MAP[:scissors] + SCORE_MAP[:win]
    when %w[C X]
      return SCORE_MAP[:rock] + SCORE_MAP[:win]
    when %w[C Y]
      return SCORE_MAP[:paper] + SCORE_MAP[:lose]
    when %w[C Z]
      return SCORE_MAP[:scissors] + SCORE_MAP[:draw]
    end
    raise StandardError, 'UNKNOWN'
  end

  def score_game_v2(player1:, player2:)
    case [player1, player2]
    when %w[A X]
      return SCORE_MAP[:scissors] + SCORE_MAP[:lose]
    when %w[A Y]
      return SCORE_MAP[:rock] + SCORE_MAP[:draw]
    when %w[A Z]
      return SCORE_MAP[:paper] + SCORE_MAP[:win]
    when %w[B X]
      return SCORE_MAP[:rock] + SCORE_MAP[:lose]
    when %w[B Y]
      return SCORE_MAP[:paper] + SCORE_MAP[:draw]
    when %w[B Z]
      return SCORE_MAP[:scissors] + SCORE_MAP[:win]
    when %w[C X]
      return SCORE_MAP[:paper] + SCORE_MAP[:lose]
    when %w[C Y]
      return SCORE_MAP[:scissors] + SCORE_MAP[:draw]
    when %w[C Z]
      return SCORE_MAP[:rock] + SCORE_MAP[:win]
    end
    raise StandardError, 'UNKNOWN'
  end

  def file_path
    './advent/day2/data/data.txt'
  end

  def game_result(version:)
    score = 0
    File.foreach(file_path) do |game|
      game = game.split
      score += if version == 1
                 score_game_v1(player1: game[0],
                               player2: game[1])
               else
                 score_game_v2(
                   player1: game[0], player2: game[1]
                 )
               end
    end
    score
  end
end
