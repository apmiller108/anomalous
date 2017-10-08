module Anomalous
  class Detector
    extend Forwardable

    def_delegators(:@loader,
                   :cross_val_set,
                   :examples,
                   :test_set,
                   :training_set)

    def initialize(loader:)
      @loader = loader
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.call examples
    end

    def probability_density_cross_val
      Anomalous::ProbabilityDensity.call cross_val_set, gaussian_params
    end

    def render_histogram(**args)
      Plot::Histogram.new(examples, args).call
    end
  end
end
