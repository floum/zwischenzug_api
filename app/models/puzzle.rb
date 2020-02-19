class Puzzle < ApplicationRecord
  has_many :challenges

  def self.random(n = 1)
    order('RANDOM()').first(n)
  end
end
