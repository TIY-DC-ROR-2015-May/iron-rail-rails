class StationsController < ApplicationController
  skip_before_action :hardcode_json_format, only: [:dashboard]

  def index
    lat, long, rad = params[:latitude], params[:longitude], params[:index]
    bikes = BikeshareStation.nearby lat, long, rad
    metros = MetroStation.nearby lat, long, rad

    @locations = bikes + metros
  end

  def dashboard
  end
end
