class Charge < ApplicationRecord
  enum category: {
    food: 0,
    extra_food: 1,
    alcohol: 2,
    transport: 3,
    mobile: 4,
    internet: 5,
    flat: 6,
    domestic: 7,
    one_time: 8
  }

  scope :find_by_month_and_year, -> (month, year) { where("extract(year from date) = ? and extract(month from date) =?", year, month) }
  scope :find_by_date, -> (date) { where("extract(year from date) = ? and extract(month from date) =? and extract(day from date) = ?", date.year, date.month, date.day) }

  def formatted_price
    ActionController::Base.helpers.number_to_currency(price, separator: ' грн. ', unit: 'коп.', format: "%n %u")
  end
end
