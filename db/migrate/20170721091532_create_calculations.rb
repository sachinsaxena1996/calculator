class CreateCalculations < ActiveRecord::Migration[5.0]
  def change
    create_table :calculations do |t|
      t.string :expression
      t.integer :evaluation
      t.timestamps
    end
  end
end
