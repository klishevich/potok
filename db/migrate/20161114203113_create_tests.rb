class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.date :expiration_date

      t.timestamps
    end
  end
end
