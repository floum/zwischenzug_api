json.id @puzzle.id

json.challenges @puzzle.challenges do |challenge|
  json.id challenge.id
  json.fen challenge.fen
  json.expected_fens challenge.expected_positions do |position|
    position.fen
  end
end
