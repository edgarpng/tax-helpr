class FiscalMonthsController < ApplicationController
  def show
  	@fiscal_month = FiscalMonth.find_by_year_and_month(params[:year], params[:month]) 
    @fiscal_month ||= FiscalMonth.new
    @fiscal_month.year = params[:year]
    @fiscal_month.month = params[:month]
  end

  def index
    @fiscal_months = FiscalMonth.all
  end

  def create

  end
end
