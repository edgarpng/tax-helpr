require 'date'

class FiscalMonth < ActiveRecord::Base

  after_initialize :after

  belongs_to :user, :inverse_of => :fiscal_months
  has_many :expenses, :inverse_of => :fiscal_month
  has_many :incomes, :inverse_of => :fiscal_month
  has_one :iva
  has_one :isr
  has_one :ietu

  attr_accessible :month, :year

  def after
  	self.month = Date.today.month
  	self.year = Date.today.year
  end

  def self.by_year_and_month(year, month)
    fiscal_month = FiscalMonth.find_by_year_and_month(year, month)
    fiscal_month ||= FiscalMonth.new
    fiscal_month.year = year
    fiscal_month.month = month
    return fiscal_month
  end
end
