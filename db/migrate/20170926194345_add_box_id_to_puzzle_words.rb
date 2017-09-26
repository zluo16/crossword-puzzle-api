class AddBoxIdToPuzzleWords < ActiveRecord::Migration[5.1]
  def change
    add_column :puzzle_words, :boxId, :integer
  end
end
