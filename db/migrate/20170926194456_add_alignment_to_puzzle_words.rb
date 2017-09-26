class AddAlignmentToPuzzleWords < ActiveRecord::Migration[5.1]
  def change
    add_column :puzzle_words, :alignment, :string
  end
end
