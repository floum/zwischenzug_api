class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.references :position, null: false, foreign_key: true
      t.references :puzzle, null: false, foreign_key: true
      t.string :last_move
      
      t.string :continuation, array: true, default: []
      t.timestamps
    end
  end
end
