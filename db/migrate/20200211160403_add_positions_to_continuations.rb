class AddPositionsToContinuations < ActiveRecord::Migration[6.0]
  def change
    add_column :continuations, :position_ids, :integer, array: true, default: []
  end
end
