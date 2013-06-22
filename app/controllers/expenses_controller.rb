class ExpensesController < ApplicationController
  def show
  end

  def index
  end

  def delete
  end

  def new
    @fiscal_month = FiscalMonth.find_by_id(params[:id]) || FiscalMonth.new
    @fiscal_month.id = params[:id]
    @expense = Expense.new
    @fiscal_month.expenses << @expense
    @expense.fiscal_month = @fiscal_month
  end
end
