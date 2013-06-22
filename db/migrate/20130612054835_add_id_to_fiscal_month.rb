class AddIdToFiscalMonth < ActiveRecord::Migration
  def change
    add_column :fiscal_months, :id, :primary_key
  end
end
