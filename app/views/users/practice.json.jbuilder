json.id @puzzle.id

json.challenges @puzzle.challenges do |challenge|
  json.id challenge.id
  json.fen challenge.fen
  json.plys challenge.plys do |ply|
    json.san ply.san
  end
end
