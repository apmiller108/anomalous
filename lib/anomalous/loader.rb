module Anomalous
  class Loader
    attr_reader :matrix
    SUPPORTED_DATA_FORMATS = %w{array harwell_boeing matlab market point_cloud}

    def initialize(data, options)
      @data_format = options[:data_format]
      @matrix = convert_to_nmatrix data
    end

    private

    def convert_to_nmatrix(data)
      case @data_format
      when :array
        N[*data]
      when :harwell_boeing
        NMatrix::IO::HarwellBoeing.load(data)[0]
      when :matlab
        NMatrix::IO::Matlab.load(data)
      when :market
        NMatrix::IO::Market.load(data)
      when :point_cloud
        NMatrix::IO::PointCloud.load(data)
      else
        raise "Data format should be one of #{SUPPORTED_DATA_FORMATS}"
      end
    end
  end
end
