class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :owner_name
      t.string :due_date
      t.string :cvv
      t.integer :cuote_number

      t.timestamps
    end
  end
end
