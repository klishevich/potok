class CreateCreditPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_payments do |t|
      t.references :credit, foreign_key: true
      t.integer :month
      t.decimal :amount, precision: 15, scale: 2
      t.boolean :is_fine, default: false
      t.integer :fine_months

      t.timestamps
    end
  end
end
