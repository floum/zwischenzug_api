User.create(username: 'floum', password: 'secret')

puzzles = YAML.load_file('db/puzzles.yml')

puzzles["puzzles"].each do |puzzle|
  challenges = puzzle["challenges"].reduce([]) do |challenges, challenge|
    position = Position.create(fen: challenge["fen"])
    ply = Ply.create(san: challenge["ply"], value: "best", position: position)
    challenges << Challenge.create(position: position)
  end
  Puzzle.create(challenge_ids: challenges.map(&:id))
end
