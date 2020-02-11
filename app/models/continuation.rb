class Continuation < ApplicationRecord
  belongs_to :challenge

  def positions
    Position.where(id: position_ids)
  end

  def fens
    positions.map(&:fen)
  end
end
