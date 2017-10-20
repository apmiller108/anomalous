module Anomalous
  module Data
    class Loader
      extend Forwardable
      def_delegators :@data_set, :training_set, :test_set, :cross_val_set

      attr_reader :examples

      def initialize(examples, options = {})
        @data_format = options.fetch(:data_format, :array)
        @examples    = initialize_nmatrix examples
        @data_set    = Anomalous::Data::Set.new(examples: @examples)
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
end
