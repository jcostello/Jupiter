module Jupiter
  class ForecastFactory

    def create_forecast(params)
      Jupiter::Forecast.new(params)
    end
  end
end
