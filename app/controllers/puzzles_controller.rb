class PuzzlesController < ApplicationController
  def create
    puzzle = Puzzle.new

    challenges = params['challenges'].map do |challenge|
      position = Position.new(fen: challenge['fen'])
      challenge_object = Challenge.new(position: position)
      expected_position_ids = challenge['expected_fens'].map do |fen|
        Position.create(fen: fen)
      end.map(&:id)
      challenge_object.expected_position_ids = expected_position_ids
      challenge_object
    end

    puzzle.challenges = challenges
    puzzle.save
  end
end
