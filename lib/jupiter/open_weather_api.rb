require 'httparty'
require_relative 'open_weather_api_parser.rb'

module Jupiter
  class OpenWeatherApi
    include HTTParty
    
    base_uri 'http://api.openweathermap.org/data/2.5'

    def initialize(parser)
      @parser = parser
    end

    def weather(city)
      response = self.class.get("/weather", query: { q: city })
      parser.parse_weather(response)
    end

    protected

    def parser
      @parser
    end

  end
end
