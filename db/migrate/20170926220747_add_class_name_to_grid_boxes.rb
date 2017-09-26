class AddClassNameToGridBoxes < ActiveRecord::Migration[5.1]
  def change
    add_column :grid_boxes, :className, :string
  end
end
