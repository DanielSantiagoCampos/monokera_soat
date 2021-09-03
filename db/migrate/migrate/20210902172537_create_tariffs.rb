class CreateTariffs < ActiveRecord::Migration[6.1]
  def change
    create_table :tariffs do |t|
      t.integer :code
      t.string :cylinders_description
      t.boolean :younger_than_twelve, default: false
      t.float :prime_tax
      t.float :contribution_tax
      t.float :total_value

      t.references :tariff_type

      t.timestamps
    end
  end
end
