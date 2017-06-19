class Coordinate
  attr_accessor :name, :latitude, :longitude

  def initialize(name, latitude, longitude)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def create_user
    User.create(
      email: "#{name}@test.com",
      password: "password",
      birthdate: rand(18...50).years.ago,
      latitude: latitude,
      longitude: longitude
    )
  end
end

if Rails.env == "development"
  coordinates = [
    Coordinate.new("home", 40.8235016, -73.9458406),
    Coordinate.new("times_square", 40.758895, -73.9873197),
    Coordinate.new("empire_state", 40.7484404, -73.9878441),
    Coordinate.new("penn_station", 40.750568, -73.9957077),
    Coordinate.new("world_trade_center", 40.711556, -74.0145544),
    Coordinate.new("brooklyn_bridge", 40.7058094, -73.9981622),
    Coordinate.new("grand_canyon", 36.0911047, -113.4035697),
    Coordinate.new("eiffel_tower", 48.8583701, 2.2922926),
    Coordinate.new("louvre_museum", 48.8606111,2.3354553),
    Coordinate.new("great_pyramid_at_giza", 29.9792345, 31.1320132),
    Coordinate.new("machupicchu", -13.157051, -72.521782),
    Coordinate.new("panama_canal", 9.1079631,-79.8641385),
    Coordinate.new("yosemite", 37.8529772,-119.8312937),
    Coordinate.new("yellowstone", 44.5844249,-111.0744731),
    Coordinate.new("niagara_falls", 43.0995002,-79.0437609)
  ]
  coordinates.each { |coordinate| coordinate.create_user }
end
