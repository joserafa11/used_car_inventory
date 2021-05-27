class Car < ApplicationRecord
  belongs_to :dealership

  validates :original_price, numericality: true
  validates :description, :serial_number, :car_status, :reception_date, presence: true
  validates :serial_number, uniqueness: true
  validates :car_status, inclusion: { in: CarStatuses.all_status_keys, message: "%{value} is not a valid status" }
  validates :serial_number, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }

  def price
    current_price = original_price
    date = reception_date + 1.month
    while date < DateTime.now
      current_price = current_price - (current_price * Setting.get_setting("monthly_deprecation").to_f)
      date = date + 1.month
    end
    ( current_price).round(2)
  end
end
