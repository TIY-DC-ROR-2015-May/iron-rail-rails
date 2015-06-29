json.locations @locations do |location|
  json.latitude  location.lat.to_s
  json.longitude location.long.to_s
  json.name      location.name

  if location.is_a? BikeshareStation
    json.type "bikeshare"
    json.(location, :num_bikes, :num_empty_docks, :last_update)
  end

  if location.is_a? MetroStation
    json.type "metro"
    json.address location.address
    json.trains  location.upcoming_trains do |train|
      json.(train, :line, :time, :cars, :direction, :min)
    end
    json.next location.next_train
  end
end
