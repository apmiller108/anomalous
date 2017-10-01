module Anomalous
  class Detector
    extend Forwardable

    def_delegators :@loader, :examples, :labels

    def initialize(loader:)
      @loader = loader
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.estimate_for examples
    end

    def render_histogram(**args)
      Plot::Histogram.new(examples, args).call
    end
  end
end
