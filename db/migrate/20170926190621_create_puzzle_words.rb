class CreatePuzzleWords < ActiveRecord::Migration[5.1]
  def change
    create_table :puzzle_words do |t|
      t.references :word, foreign_key: true
      t.references :puzzle, foreign_key: true

      t.timestamps
    end
  end
end
