class CreateFiscalMonths < ActiveRecord::Migration
  def change
    create_table :fiscal_months, :id => false do |t|
      t.references :user
      t.integer :month
      t.integer :year

      t.timestamps
    end
    add_index :fiscal_months, :user_id
    add_index :fiscal_months, [:month, :year]
  end
end
