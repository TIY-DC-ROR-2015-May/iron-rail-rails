class MetroStation < ActiveRecord::Base
  validates_presence_of   :code, :name, :lat, :long, :address
  validates_uniqueness_of :code

  def self.nearby lat, long, rad
    rad ||= 1609.34 # 1 mile, in meters
    all.select  { |station| station.distance_to(lat, long) < Float(rad) }
  end

  def distance_to other_lat, other_long
    Haversine.distance(self.lat, self.long, Float(other_lat), Float(other_long)).to_meters
  end

  def address
    JSON.parse self[:address]
  end

  def upcoming_trains
    MetroAPI.upcoming_trains code
  end
end
