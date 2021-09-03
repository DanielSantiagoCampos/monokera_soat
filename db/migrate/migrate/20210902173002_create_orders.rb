class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.datetime :start_at
      t.datetime :finish_at
      t.float :payment_value

      t.references :user
      t.references :vehicle
      t.references :tariff
      t.references :credit_card

      t.timestamps
    end
  end
end
