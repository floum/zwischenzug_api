class Challenge < ApplicationRecord
  belongs_to :puzzle
  belongs_to :position
  has_one :continuation

  delegate :fen, to: :position

  def expected_positions
    Position.where(id: expected_position_ids)
  end

  def expected_fens
    expected_positions.map(&:fen)
  end
end
