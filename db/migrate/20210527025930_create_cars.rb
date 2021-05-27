class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.decimal :original_price, precision: 18, scale: 2
      t.string :car_status, limit: 20
      t.string :description
      t.datetime :reception_date
      t.string :serial_number, limit: 100
      t.references :dealership, null: false, foreign_key: true


      t.timestamps
    end
    add_index :cars, :serial_number, unique: true
  end
end
