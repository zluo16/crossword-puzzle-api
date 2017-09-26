class AddPuzzleReferenceToGridBoxes < ActiveRecord::Migration[5.1]
  def change
    add_reference :grid_boxes, :puzzle, foreign_key: true
  end
end
