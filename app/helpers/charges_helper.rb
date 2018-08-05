module ChargesHelper
  def month_title(charges)
    charges.values.first.first.date.strftime('%B')
  end

  def day_title(charges)
    charges.first.date.strftime('%d %B')
  end

  def format_price(amount)
    number_to_currency(amount, separator: ' грн. ', unit: 'коп.', format: "%n %u")
  end
end