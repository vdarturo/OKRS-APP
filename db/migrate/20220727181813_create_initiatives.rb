class CreateInitiatives < ActiveRecord::Migration[7.0]
  def change
    create_table :initiatives do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :type_metric
      t.decimal :start_value
      t.decimal :target
      t.decimal :current_value
      t.decimal :progress
      t.references :key_result, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
