class RemoveColumnTypeFromGridBoxes < ActiveRecord::Migration[5.1]
  def change
    remove_column :grid_boxes, :type
  end
end
