class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :client, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2
      t.integer :credit_period_months
      t.decimal :rate, precision: 5, scale: 2
      t.integer :period_months
      t.decimal :fine_rate, precision: 5, scale: 2
      t.decimal :amount_left, precision: 15, scale: 2

      t.timestamps
    end
  end
end
