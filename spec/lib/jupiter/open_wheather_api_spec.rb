require 'spec_helper'

describe Jupiter::OpenWeatherApi do
  let(:parser) { double } 
  let(:response) { double } 
  let(:api) { Jupiter::OpenWeatherApi.new(parser) } 

  before do
    allow(api.class).to receive(:get).and_return(response)
    allow(parser).to receive(:parse_weather)
  end

  describe "#weather" do

    it "calls the rest service" do
      expect(api.class).to receive(:get).with("/weather", query: { q: "City" })

      api.weather("City")
    end

    it "passes the response to the parser" do
      expect(parser).to receive(:parse_weather).with(response)

      api.weather("City")
    end
  end
end
