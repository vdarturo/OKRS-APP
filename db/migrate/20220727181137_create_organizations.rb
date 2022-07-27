class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :vision
      t.text :mision

      t.timestamps
    end
  end
end
