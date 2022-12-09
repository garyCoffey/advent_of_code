# frozen_string_literal: true

# RuckSack runs code for advent day3
class RuckSack
  def result
    "dfsf"
  end

  private

  def file_path
    './advent/day3/data/data.txt'
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
