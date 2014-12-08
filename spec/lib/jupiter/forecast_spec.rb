require 'spec_helper'

describe Jupiter::Forecast do
  describe "#initialize" do
    let(:params) { { description: "Description", temperature: 25, humidity: 30, min_temperature: 0, max_temperature: 30, wind_speed: 15 } }

    it "returns a new forecast" do
      forecast = Jupiter::Forecast.new(params)
      expect(forecast.description).to eq("Description")
      expect(forecast.temperature).to eq(25)
      expect(forecast.humidity).to eq(30)
      expect(forecast.min_temperature).to eq(0)
      expect(forecast.max_temperature).to eq(30)
      expect(forecast.wind_speed).to eq(15)
    end
  end
end
