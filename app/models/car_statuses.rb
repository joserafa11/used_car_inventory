class CarStatuses
  include ActiveModel::Model

  attr_accessor :id, :name

  ALL_STATUSES = {
    'available' => "Available",
    'sold' => "Sold",
    'reserved' => "Reserved"
  }
  private_constant :ALL_STATUSES
  
  def initialize(id, name)
    @id = id
    @name =  name
  end

  def self.all_status_keys
    ALL_STATUSES.keys
  end

  def self.all
    result = []
    ALL_STATUSES.each { |key, value|  result << new(key, value) }
    result
  end

  def self.find(id)
    all.collect{|status| status if status.id == id}.compact.first
  end

  def self.get_name(id)
    status = self.find(id)
    status.nil? ? id : status.name
  end
  
end