class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
