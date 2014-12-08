require_relative 'metric_forecast.rb'
require_relative "forecast.rb"

module Jupiter
  class ImperialForecast < Forecast

    def to_metric
      MetricForecast.new({ description: self.description,
                           temperature: fahrenheit_to_celsius(self.temperature),
                           humidity: self.humidity,
                           min_temperature: fahrenheit_to_celsius(self.min_temperature),
                           max_temperature: fahrenheit_to_celsius(self.max_temperature),
                           wind_speed: mph_to_kph(self.wind_speed) })
    end

    protected

    def fahrenheit_to_celsius(temperature)
      ((temperature - 32) * (5.0 / 9.0)).round(2)
    end

    def mph_to_kph(miles)
      (miles * 1.609).round(2)
    end
  end
end
