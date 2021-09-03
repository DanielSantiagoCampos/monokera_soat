class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :document
      t.string :document_type
      t.string :full_name
      t.string :email, index: true, unique: true
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
