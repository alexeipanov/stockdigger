class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.integer :position
      t.references :image, foreign_key: true
      t.references :keyword, foreign_key: true

      t.timestamps
    end
  end
end
