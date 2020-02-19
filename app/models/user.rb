class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 4 },
    if: -> { new_record? || !password.nil? }

  def planned_puzzles
    Puzzle.where(id: planned_pgn_ids).to_a << Puzzle.random
  end
end
