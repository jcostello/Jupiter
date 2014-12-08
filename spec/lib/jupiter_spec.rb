require 'spec_helper'

describe Jupiter::Base do

  let(:jupiter) { Jupiter::Base.new }
  let(:response) { double }
  let(:city) { "Buenos Aires" }

  before do
    allow(jupiter).to receive(:api).and_return(double)
    allow(jupiter.api).to receive(:weather).and_return(response)
    allow(jupiter).to receive(:forecast_factory).and_return(double)
  end

  describe "#forecast_for_today" do
    it "calls the api and return a forecast" do
      expect(jupiter.api).to receive(:weather).with(city)
      expect(jupiter.forecast_factory).to receive(:create_forecast).with(response)

      jupiter.forecast_for_today(city)
    end
  end
end
