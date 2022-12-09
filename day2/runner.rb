class Day2

  SCORE_MAP = {
    rock: 1,
    paper: 2,
    scissors: 3,
    win: 6,
    draw: 3,
    lose: 0
  }

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
  }

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

  def decode(player1:, player2:, version:)
    if version == 1
    else
    end
  end

  def score_game_v1(player1:, player2:)
    case [player1, player2]
    when ['A', 'X']
      return SCORE_MAP[:rock] + SCORE_MAP[:draw]
    when ['A', 'Y']
      return SCORE_MAP[:paper] + SCORE_MAP[:win]
    when ['A', 'Z']
      return SCORE_MAP[:scissors] + SCORE_MAP[:lose]
    when ['B', 'X']
      return SCORE_MAP[:rock] + SCORE_MAP[:lose]
    when ['B', 'Y']
      return SCORE_MAP[:paper] + SCORE_MAP[:draw]
    when ['B', 'Z']
      return SCORE_MAP[:scissors] + SCORE_MAP[:win]
    when ['C', 'X']
      return SCORE_MAP[:rock] + SCORE_MAP[:win]
    when ['C', 'Y']
      return SCORE_MAP[:paper] + SCORE_MAP[:lose]
    when ['C', 'Z']
      return SCORE_MAP[:scissors] + SCORE_MAP[:draw]
    end
    raise StandardError.new('UNKNOWN')
  end

  def score_game_v2(player1:, player2:)
    case [player1, player2]
    when ['A', 'X']
      return SCORE_MAP[:scissors] + SCORE_MAP[:lose]
    when ['A', 'Y']
      return SCORE_MAP[:rock] + SCORE_MAP[:draw]
    when ['A', 'Z']
      return SCORE_MAP[:paper] + SCORE_MAP[:win]
    when ['B', 'X']
      return SCORE_MAP[:rock] + SCORE_MAP[:lose]
    when ['B', 'Y']
      return SCORE_MAP[:paper] + SCORE_MAP[:draw]
    when ['B', 'Z']
      return SCORE_MAP[:scissors] + SCORE_MAP[:win]
    when ['C', 'X']
      return SCORE_MAP[:paper] + SCORE_MAP[:lose]
    when ['C', 'Y']
      return SCORE_MAP[:scissors] + SCORE_MAP[:draw]
    when ['C', 'Z']
      return SCORE_MAP[:rock] + SCORE_MAP[:win]
    end
    raise StandardError.new('UNKNOWN')
  end

  def file_path
    './day2/data/data.txt'
  end

  def game_result(version:)
    score = 0
    File.foreach(file_path) do |game|
      game = game.split
      score += version == 1 ? score_game_v1(player1: game[0], player2: game[1]) : score_game_v2(player1: game[0], player2: game[1])
    end
    score
  end
end