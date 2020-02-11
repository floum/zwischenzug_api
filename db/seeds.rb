User.create(username: 'floum', password: 'secret')

puzzles = YAML.load_file('db/puzzles.yml')

p puzzles

puzzles["puzzles"].each do |puzzle|
  puzzle_object = Puzzle.create()
  puzzle["challenges"].each do |challenge|
    position = Position.create(fen: challenge["fen"])

    expected_positions = challenge["expected_fens"].map do |fen|
      Position.find_by(fen: fen) || Position.create(fen: fen)
    end

    challenge_object = Challenge.create(
      position: position,
      expected_position_ids: expected_positions.map(&:id),
      puzzle: puzzle_object
    )

    continuation_positions = challenge["continuation"].map do |fen|
      Position.find_by(fen: fen) || Position.create(fen: fen)
    end

    Continuation.create(
      challenge: challenge_object,
      position_ids: continuation_positions.map(&:id)
    )
  end
end
