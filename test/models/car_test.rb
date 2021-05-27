require "test_helper"

class CarTest < ActiveSupport::TestCase
  setup do
    @dealership = Dealership.first
  end

  test "should not save a car without a description" do
    car = Car.new(
      description: "", 
      serial_number: "123456789", 
      car_status: "available",
      reception_date: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"),
      dealership_id: @dealership.id,
      original_price: 9.99
    )
    assert_not car.save, "Saved a car without a description"
  end

  test "should have unique serial number" do
    car = Car.new(
      description: "Car 1", 
      serial_number: "123456789", 
      car_status: "available",
      reception_date: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"),
      dealership_id: @dealership.id,
      original_price: 9.99
    )
    assert car.save, "Car should be saved with valid parameters"
    car2 = Car.new(
      description: "Car 2", 
      serial_number: "123456789", 
      car_status: "available",
      reception_date: DateTime.now.strftime("%Y-%m-%d %H:%M:%S"),
      dealership_id: @dealership.id,
      original_price: 9.99
    )
    assert_not car2.save, "Different Cars shouldn't have the same serial number"
  end

  test "should be deprecated twice in two months" do
    car = Car.new(
      description: "Car 1", 
      serial_number: "3738292187", 
      car_status: "available",
      reception_date: (DateTime.now - 2.months - 5.days).strftime("%Y-%m-%d %H:%M:%S"),
      dealership_id: @dealership.id,
      original_price: 10.0
    )

    assert car.price == 9.60, "Deprecation of 2% in two months is incorrect Expected: 9.60, Obtained: #{car.price}"
  end
end
