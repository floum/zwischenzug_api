class AddExpectedPositionsToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :expected_position_ids, :integer, array: true, default: []
  end
end
