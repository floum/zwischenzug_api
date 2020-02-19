class AddPlannedPuzzleIdsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :planned_puzzle_ids, :integer, array: true, default: []
  end
end
