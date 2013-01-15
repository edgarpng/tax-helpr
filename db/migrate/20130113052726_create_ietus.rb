class CreateIetus < ActiveRecord::Migration
  def change
    create_table :ietus, :id => false do |t|
      t.references :fiscal_month
      t.decimal :amount
      t.decimal :penalty
      t.decimal :updated_part

      t.timestamps
    end
    add_index :ietus, :fiscal_month_id
  end
end
