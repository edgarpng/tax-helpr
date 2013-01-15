class FiscalMonth < ActiveRecord::Base
  belongs_to :user, :inverse_of => :fiscal_months
  has_many :expenses, :inverse_of => :fiscal_month
  has_many :incomes, :inverse_of => :fiscal_month
  has_one :iva
  has_one :isr
  has_one :ietu

  attr_accessible :month, :year
end
