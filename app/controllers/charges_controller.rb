class ChargesController < ApplicationController
  def index
    @charges = Charge.find_by_month_and_year(charge_date_params[:month], charge_date_params[:year]).order(:date)
    @charges_day = @charges.group_by {|t| t.date.day }
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.save!
  end

  private

  def charge_date_params
    {
      month: params.dig(:date, :month) || Date.today.month,
      year: params.dig(:date, :year) || Date.today.year,
    }
  end

  def charge_params
    params.require(:charge).permit(%i[name, price category amount])
  end
end
