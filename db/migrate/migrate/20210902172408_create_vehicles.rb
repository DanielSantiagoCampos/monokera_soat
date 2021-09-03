class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :placa, limit: 6
      t.datetime :date

      t.references :tariff

      t.timestamps
    end
  end
end
