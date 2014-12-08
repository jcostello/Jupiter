module Jupiter
  class OpenWeatherApiParser
    
    def parse_weather(response)
      main_data = response["main"]
      { description: response["weather"][0]["description"],
                 temperature: main_data["temp"],
                 humidity: main_data["humidity"],
                 min_temperature: main_data["temp_min"],
                 max_temperature: main_data["temp_max"],
                 wind_speed: response["wind"]["speed"] }
    end
  end
end

