json.id @puzzle.id

json.challenges @puzzle.challenges do |challenge|
  json.id challenge.id
  json.fen challenge.fen
  json.expected_fens challenge.expected_fens
  if challenge.continuation
    json.continuation challenge.continuation.fens
  end
end
