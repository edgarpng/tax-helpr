class FiscalMonthsController < ApplicationController
  def show
  	@month = FiscalMonth.find_by_year_and_month(params[:year], params[:month]) || FiscalMonth.new
  end
end
