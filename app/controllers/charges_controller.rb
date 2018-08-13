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
    if @charge.save
      flash[:success] = 'Добавлено :)'
      redirect_to new_charge_path
    else
      flash[:error] = 'ошибка :('
      render :new
    end
  end

  def edit
    @charge = Charge.find(params[:id])
  end

  def update
    @charge = Charge.find(params[:id])
    if @charge.update(charge_params)
      flash[:success] = 'Изменения сохранены'
      redirect_to charges_path
    else
      render :edit
    end
  end

  def destroy
    @charge = Charge.find(params[:id])
    if @charge.destroy
      flash[:success] = 'Запись удалена'
      redirect_to charges_path
    end
  end

  private

  def charge_date_params
    {
      month: params.dig(:date, :month) || Date.today.month,
      year: params.dig(:date, :year) || Date.today.year,
    }
  end

  def charge_params
    params.require(:charge).permit(%i[name price category amount date])
  end
end
