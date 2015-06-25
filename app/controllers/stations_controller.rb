class StationsController < ApplicationController
  def index
    lat, long, rad = params[:latitude], params[:longitude], params[:index]
    bikes = BikeshareStation.nearby lat, long, rad
    metros = MetroStation.nearby lat, long, rad

    @locations = bikes + metros
  end
end
