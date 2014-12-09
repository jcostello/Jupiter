require 'spec_helper'

describe Jupiter::ForecastFactory do
  describe "create_forecast" do

    let(:params) { double }
    let(:factory) { Jupiter::ForecastFactory.new }

    it "should create a metric forecast" do
      expect(Jupiter::Forecast).to receive(:new).with(params)
      factory.create_forecast(params)
    end
  end
end
