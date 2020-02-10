User.create(username: 'floum', password: 'secret')

puzzles = YAML.load_file('db/puzzles.yml')

p puzzles

puzzles["puzzles"].each do |puzzle|
  puzzle_object = Puzzle.create()
  puzzle["challenges"].each do |challenge|
    position = Position.create(fen: challenge["fen"])
    challenge["plys"].each do |ply|
      Ply.create(san: ply, position: position)
    end
    Challenge.create(position: position, puzzle: puzzle_object)
  end
end
