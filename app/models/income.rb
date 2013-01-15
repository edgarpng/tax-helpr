class Income < ActiveRecord::Base
  belongs_to :fiscal_month, :inverse_of => :incomes
  attr_accessible :amount, :description, :iva
end
