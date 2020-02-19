class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password,
    length: { minimum: 4 },
    if: -> { new_record? || !password.nil? }

  def planned_puzzles
    if planned_puzzle_ids.size < 5
      plan_puzzles(Puzzle.random(5))
    end
    planned_puzzle_ids.map { |id| Puzzle.find(id) }
  end

  def plan_puzzle(puzzle)
    plan_puzzles([puzzle])
  end

  def plan_puzzles(puzzles)
    puzzles.map(&:id).each do |puzzle_id|
      planned_puzzle_ids << puzzle_id
    end
    save
  end

  def unplan_puzzle(puzzle)
    planned_puzzle_ids.delete(puzzle.id)
    save
  end
end
