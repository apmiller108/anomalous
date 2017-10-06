module Anomalous
  class Loader
    SUPPORTED_DATA_FORMATS = %i{array harwell_boeing matlab market point_cloud}.freeze
    attr_reader :examples, :training_set, :anomalous_examples, :cross_val_set

    def initialize(examples, options = {})
      @data_format = options.fetch(:data_format, :array)
      @examples = initialize_nmatrix examples
      @training_set, @cross_val_set = build_datasets
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

    def build_datasets
      non_anomalous, anomalous = partition_data
      split_index = (non_anomalous.size * 0.8).round
      [
        non_anomalous[0..(split_index - 1)],
        non_anomalous[split_index..-1].concat(anomalous)
      ].map { |array| N[*array] }
    end

    def partition_data
      examples.to_a.partition { |example| example.last.zero? }
    end
  end
end
