class CreatePuzzles < ActiveRecord::Migration[6.0]
  def change
    create_table :puzzles do |t|
      t.integer :challenge_ids, array: true, default: []

      t.timestamps
    end
  end
end
