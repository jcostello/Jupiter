require 'spec_helper'

describe Jupiter::ImperialForecast do
  describe "#to_metric" do
    let(:params) { { description: "Description", temperature: 100, humidity: 30, min_temperature: 90, max_temperature: 130, wind_speed: 15 } }
    let(:forecast) { Jupiter::ImperialForecast.new(params) }

    it "returns a new metric forecast" do
      result = forecast.to_metric
      expect(result.description).to eq("Description")
      expect(result.temperature).to eq(37.78)
      expect(result.humidity).to eq(30)
      expect(result.min_temperature).to eq(32.22)
      expect(result.max_temperature).to eq(54.44)
      expect(result.wind_speed).to eq(24.14)
    end
  end
end
