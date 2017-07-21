class CreateCalculations < ActiveRecord::Migration[5.0]
  def change
    create_table :calculations do |t|
      t.string :expression
      t.string :string
      t.string :evaluation
      t.string :integer

      t.timestamps
    end
  end
end
