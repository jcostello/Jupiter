require 'spec_helper'

describe Jupiter::ForecastFactory do
  describe "create_forecast" do

    let(:params) { double }

    context "with metric system" do

      let(:factory) { Jupiter::ForecastFactory.new("metric") }
      let(:forecast_class) { Jupiter::MetricForecast }

      it "should create a metric forecast" do
        expect(forecast_class).to receive(:new).with(params)
        factory.create_forecast(params)
      end
    end

    context "with imperial system" do

      let(:factory) { Jupiter::ForecastFactory.new("imperial") }
      let(:forecast_class) { Jupiter::ImperialForecast }

      it "should create a imperial forecast" do
        expect(forecast_class).to receive(:new).with(params)
        factory.create_forecast(params)
      end
    end
  end

end
