class Ply < ApplicationRecord
  self.table_name = :plys

  belongs_to :position
end
