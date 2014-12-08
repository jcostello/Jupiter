require 'spec_helper'

describe Jupiter::MetricForecast do
  describe "#to_imperial" do
    let(:params) { { description: "Description", temperature: 37.78, humidity: 30, min_temperature: 32.22, max_temperature: 54.446, wind_speed: 24.14 } }
    let(:forecast) { Jupiter::MetricForecast.new(params) }

    it "returns a new metric forecast" do
      result = forecast.to_imperial
      expect(result.description).to eq("Description")
      expect(result.temperature).to eq(100)
      expect(result.humidity).to eq(30)
      expect(result.min_temperature).to eq(90)
      expect(result.max_temperature).to eq(130)
      expect(result.wind_speed).to eq(15)
    end
  end
end
