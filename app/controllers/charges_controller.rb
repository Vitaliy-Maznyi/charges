class ChargesController < ApplicationController
  def index
    @charges = Charge.find_by_month_and_year(charge_date_params[:month], charge_date_params[:year]).order(:date)
    @charges_day = @charges.group_by {|t| t.date.day }
  end

  private

  def charge_date_params
    {
      month: params[:month] || Date.today.month,
      year: params[:year] || Date.today.year,
    }
  end
end
