class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.decimal :iva
      t.string :description
      t.references :fiscal_month

      t.timestamps
    end
    add_index :expenses, :fiscal_month_id
  end
end
