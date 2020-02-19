class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 4 },
    if: -> { new_record? || !password.nil? }

  def planned_puzzles
    if planned_puzzle_ids.empty?
      plan_puzzle(Puzzle.random)
    end
    Puzzle.where(id: planned_puzzle_ids).to_a
  end

  def plan_puzzle(puzzle)
    planned_puzzle_ids << puzzle.id
    save
  end

  def unplan_puzzle(puzzle)
    if planned_puzzle_ids.first == puzzle.id
      planned_puzzle_ids.shift
    end
    save
  end
end
