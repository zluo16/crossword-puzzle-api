class CreateGridBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :grid_boxes do |t|
      t.integer :boxId
      t.string :type
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
