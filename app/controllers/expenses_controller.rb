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

  def create
    @expense = Expense.new(post_params)
    month = FiscalMonth.by_year_and_month(params[:year], params[:month])
    @expense.fiscal_month = month
    month.expenses << @expense
    user = User.find session[:user_id]
    user.fiscal_months << month
    month.user = user
    @expense.save
    month.save
    user.save
    redirect_to fiscal_month_path(year: month.year, month: month.month)
  end

  private
  def post_params
    params.require(:expense).permit(:amount, :description)
  end
end
