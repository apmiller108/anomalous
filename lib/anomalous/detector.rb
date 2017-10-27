module Anomalous
  class Detector
    extend Forwardable

    def_delegators :@loader,
                   :cross_val_set,
                   :examples,
                   :test_set,
                   :training_set

    def initialize(loader:)
      @loader = loader
    end

    def predict(examples = test_set)
      Anomalous::Prediction.new(examples, threshold[0], gaussian_params)
    end

    def threshold
      epsilon.threshold
    end

    def render_histogram(**args)
      Plot::Histogram.new(examples, args).call
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.call training_set
    end

    def epsilon
      @epsilon ||= Anomalous::Epsilon.new(cross_val_set, gaussian_params)
    end
  end
end
