require 'spec_helper'

describe Jupiter::OpenWeatherApiParser do
  let(:parser) { Jupiter::OpenWeatherApiParser.new } 

  describe "#parse_weather" do
    let(:response) { JSON.parse('{"coord":{"lon":-58.38,"lat":-34.61},"sys":{"type":1,"id":4699,"message":0.0614,"country":"AR","sunrise":1417768398,"sunset":1417820125},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01d"}],"base":"cmc stations","main":{"temp":304.63,"pressure":1014,"humidity":17,"temp_min":304.15,"temp_max":305.15},"wind":{"speed":7.2,"deg":40,"var_beg":360,"var_end":80},"clouds":{"all":0},"dt":1417798800,"id":3435910,"name":"Buenos Aires","cod":200}') }

    it "return a forecast stuct" do
      parsed_response = parser.parse_weather(response)
      expect(parsed_response[:description]).to eq("Sky is Clear")
      expect(parsed_response[:temperature]).to eq(304.63)
      expect(parsed_response[:humidity]).to eq(17)
      expect(parsed_response[:min_temperature]).to eq(304.15)
      expect(parsed_response[:max_temperature]).to eq(305.15)
      expect(parsed_response[:wind_speed]).to eq(7.2)
    end
  end
end
