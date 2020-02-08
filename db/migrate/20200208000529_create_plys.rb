class CreatePlys < ActiveRecord::Migration[6.0]
  def change
    create_table :plys do |t|
      t.string :san
      t.integer :position_id
      t.string :value

      t.timestamps
    end
  end
end
