class CreatePuzzles < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzles do |t|
      t.integer :times_played
      t.integer :rating

      t.timestamps
    end
  end
end
