require 'httparty'

module Jupiter
  class OpenWeatherApi
    include HTTParty
    
    base_uri 'http://api.openweathermap.org/data/2.5'

    def initialize(parser, unit_system)
      @parser = parser
      @unit_system = unit_system
    end

    def weather(city)
      response = self.class.get("/weather", query: { q: city, units: @unit_system })
      check_valid_city(response)
      parser.parse_weather(response)
    end

    def check_valid_city(response)
      raise Jupiter::CityNotFoundException if response["cod"] == "404"
    end

    protected

    def parser
      @parser
    end

  end
end
