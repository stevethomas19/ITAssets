class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :location_address
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.timestamps null: false
    end
  end
end
