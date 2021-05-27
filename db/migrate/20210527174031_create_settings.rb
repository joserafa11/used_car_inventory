class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string :code
      t.string :value

      t.timestamps
    end
    add_index :settings, :code, unique: true
  end
end
