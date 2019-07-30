class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :vehicle, foreign_key: true
      t.boolean :discounted
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end
