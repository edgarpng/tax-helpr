class Expense < ActiveRecord::Base
  belongs_to :fiscal_month, :inverse_of => :expenses
  attr_accessible :amount, :description, :iva
end
