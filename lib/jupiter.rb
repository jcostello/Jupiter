require_relative 'jupiter/forecast.rb'
require_relative 'jupiter/forecast_factory.rb'
require_relative 'jupiter/open_weather_api.rb'
require_relative 'jupiter/open_weather_api_parser.rb'
require_relative 'jupiter/city_not_found_exception.rb'

module Jupiter
  def self.forecast_for_today(city)
    response = api.weather(city)
    forecast_factory.create_forecast(response)
  end

  def self.system
    @system || "imperial"
  end

  def self.system=(system)
    @system = system if ["imperial", "metric"].include?(system.downcase)
  end

  # NOTE: I separate the dependencies for future configuration feature
  def self.api
    Jupiter::OpenWeatherApi.new(parser, system)
  end

  def self.parser
    Jupiter::OpenWeatherApiParser.new
  end

  def self.forecast_factory
    ForecastFactory.new
  end
end
