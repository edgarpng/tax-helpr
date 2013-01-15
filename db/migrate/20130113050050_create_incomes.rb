class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.decimal :amount
      t.decimal :iva
      t.string :description
      t.references :fiscal_month

      t.timestamps
    end
    add_index :incomes, :fiscal_month_id
  end
end
