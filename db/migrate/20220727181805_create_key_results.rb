class CreateKeyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :key_results do |t|
      t.string :name
      t.text :description
      t.string :period
      t.string :type_metric
      t.decimal :strat_value
      t.decimal :target
      t.decimal :current_value
      t.decimal :progress
      t.references :objective, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
