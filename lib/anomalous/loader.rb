module Anomalous
  class Loader
    attr_reader :matrix
    SUPPORTED_DATA_FORMATS = %i{array harwell_boeing matlab market point_cloud}.freeze

    def initialize(data, data_format = :array)
      @data_format = data_format
      @matrix = initialize_nmatrix data
    end

    private

    def initialize_nmatrix(data)
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
        raise AnomalousError,
              "Data format: '#{@data_format}' is not supported. Data format "\
              "should be one of #{SUPPORTED_DATA_FORMATS}"
      end
    end
  end
end
