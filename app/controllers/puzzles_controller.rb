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

  def pgn
    games = PGN.parse(params[:pgn])

    games.each do |game|
      puzzle = Puzzle.new
      challenges = game.positions.map(&:to_fen).each_slice(2).map do |fen1, fen2|
        starting_position = Position.create(fen: fen1)
        expected_position = Position.create(fen: fen2)
        Challenge.new(position: starting_position, expected_position_ids: [expected_position.id])
      end

      puzzle.challenges = challenges
      puzzle.save
    end
  end
end
