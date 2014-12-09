require 'spec_helper'

describe Jupiter do

  let(:response) { double }
  let(:city) { "Buenos Aires" }

  before do
    allow(Jupiter).to receive(:api).and_return(double)
    allow(Jupiter.api).to receive(:weather).and_return(response)
    allow(Jupiter).to receive(:forecast_factory).and_return(double)
  end

  describe "#forecast_for_today" do
    it "calls the api and return a forecast" do
      expect(Jupiter.api).to receive(:weather).with(city)
      expect(Jupiter.forecast_factory).to receive(:create_forecast).with(response)

      Jupiter.forecast_for_today(city)
    end
  end

  describe "#system" do
    context "when the system is not setted" do
      it "it returns 'imperial'" do
        expect(Jupiter.system).to eq("imperial")
      end
    end

    # TODO: I would like to talk about the before of this test suit
    context "when the system is setted" do
      before { Jupiter.instance_variable_set(:@system, "metric") }

      it "it returns the setted system" do
        expect(Jupiter.system).to eq("metric")
      end
    end
  end

  describe "#system=" do
    context "when system is imperial or metric" do
      it "sets the system" do
        Jupiter.system = "metric"
        expect(Jupiter.system).to eq("metric")
      end
    end

    context "when system is not imperial or metric" do
      it "not sets the system" do
        Jupiter.system = "metric"
        Jupiter.system = "another"
        expect(Jupiter.system).to eq("metric")
      end
    end
  end
end
