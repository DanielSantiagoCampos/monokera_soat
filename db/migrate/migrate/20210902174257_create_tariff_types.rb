class CreateTariffTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :tariff_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
