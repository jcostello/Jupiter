require 'spec_helper'

describe Jupiter::OpenWeatherApi do
  let(:parser) { double } 
  let(:unit_system) { "system" } 
  let(:response) { double } 
  let(:api) { Jupiter::OpenWeatherApi.new(parser, unit_system) } 

  describe "#weather" do

    before do
      allow(api.class).to receive(:get).and_return(response)
      allow(api).to receive(:check_valid_city)
      allow(parser).to receive(:parse_weather)
    end

    it "calls the rest service" do
      expect(api.class).to receive(:get).with("/weather", query: { q: "City", units: unit_system })

      api.weather("City")
    end

    it "check if a valid city was given" do
      expect(api).to receive(:check_valid_city).with(response)

      api.weather("City")
    end

    it "passes the response to the parser" do
      expect(parser).to receive(:parse_weather).with(response)

      api.weather("City")
    end
  end

  describe "#check_valid_city" do
    context "with a invalid city" do
      let(:response) { { "cod" => "404" } }

      it "raises a CityNotFoundException when response code is 404" do
        expect{ api.check_valid_city(response) }.to raise_error(Jupiter::CityNotFoundException)
      end
    end

    context "with a valid city" do
      let(:response) { {} }

      it "not raises any exception" do
        expect{ api.check_valid_city(response) }.to_not raise_error
      end
    end
  end
end
