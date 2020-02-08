User.create(username: 'floum', password: 'secret')

puzzles = YAML.load_file('db/puzzles.yml')

puzzles["puzzles"].each do |puzzle|
  challenges = puzzle["challenges"].reduce([]) do |challenges, challenge|
    position = Position.create(fen: challenge["fen"])
    challenge["plys"].each do |ply|
      Ply.create(san: ply, position: position)
    end
    challenges << Challenge.create(position: position)
  end
  Puzzle.create(challenge_ids: challenges.map(&:id))
end
