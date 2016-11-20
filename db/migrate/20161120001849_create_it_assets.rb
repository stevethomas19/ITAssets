class CreateItAssets < ActiveRecord::Migration
  def change
    create_table :it_assets do |t|
      t.string :asset_name
      t.string :description
      t.string :month_implemented
      t.integer :year_implemented
      t.string :maintenance_notes
      t.integer :location_id
      t.string :manufacturer_part_number
      t.integer :manufacturer_id
      t.timestamps null: false
    end
  end
end
