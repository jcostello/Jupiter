module Jupiter
  class Forecast
    attr_reader :description, :temperature, :humidity, :min_temperature, :max_temperature, :wind_speed

    def initialize(args = {})
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

  end
end
