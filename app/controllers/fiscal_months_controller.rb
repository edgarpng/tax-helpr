class FiscalMonthsController < ApplicationController
  def show
  	@fiscal_month = FiscalMonth.find_by_id(params[:id]) || FiscalMonth.new
    @fiscal_month.id = params[:id]
  end

  def index
    @fiscal_months = FiscalMonth.all
  end
end
