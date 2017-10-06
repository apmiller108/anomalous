module Anomalous
  class Detector
    extend Forwardable

    def_delegators(:@loader,
                   :examples,
                   :training_set,
                   :anomalous_examples,
                   :cross_val_set)

    def initialize(loader:)
      @loader = loader
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.estimate_for training_set
    end

    def probability_val
    end

    def render_histogram(**args)
      Plot::Histogram.new(examples, args).call
    end
  end
end
