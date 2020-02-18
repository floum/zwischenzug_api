class Puzzle < ApplicationRecord
  has_many :challenges

  def self.random
    order('RANDOM()').first
  end
end
