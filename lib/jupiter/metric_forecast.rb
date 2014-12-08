require_relative "forecast.rb"
require_relative "imperial_forecast.rb"

module Jupiter
  class MetricForecast < Forecast
    def to_imperial
      ImperialForecast.new({ description: self.description,
                           temperature: celsius_to_fahrenheit(self.temperature),
                           humidity: self.humidity,
                           min_temperature: celsius_to_fahrenheit(self.min_temperature),
                           max_temperature: celsius_to_fahrenheit(self.max_temperature),
                           wind_speed: kph_to_mph(self.wind_speed) })
    end

    protected

    def celsius_to_fahrenheit(temperature)
      (temperature * (9.0 / 5.0) + 32).round(2)
    end

    def kph_to_mph(kilometers)
      (kilometers / 1.609).round(2)
    end
  end
end
