require_relative 'metric_forecast.rb'
require_relative 'imperial_forecast.rb'

module Jupiter
  class ForecastFactory

    def initialize(system)
      @system = system
    end

    def create_forecast(params)
      Object.const_get("Jupiter::#{@system.capitalize}Forecast").new(params)
    end
  end
end
