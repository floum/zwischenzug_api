class CreateUserAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :puzzle, null: false, foreign_key: true
      t.boolean :success

      t.timestamps
    end
  end
end
