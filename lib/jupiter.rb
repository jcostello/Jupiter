require_relative 'jupiter/open_weather_api.rb'
require_relative 'jupiter/forecast_factory.rb'

module Jupiter
  class Base
    def forecast_for_today(city)
      response = api.weather(city)
      forecast_factory.create_forecast(response)
    end

    # NOTE: I separate the dependencies for future configuration feature
    def api
      Jupiter::OpenWeatherApi.new(parser)
    end

    def parser
      Jupiter::OpenWeatherApiParser.new
    end

    def forecast_factory
      ForecastFactory.new("imperial")
    end
  end
end
