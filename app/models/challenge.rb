class Challenge < ApplicationRecord
  belongs_to :puzzle
  belongs_to :position

  delegate :fen, to: :position
  delegate :plys, to: :position
end
