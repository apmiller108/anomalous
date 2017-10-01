module Anomalous
  class Detector
    extend Forwardable

    def_delegator :@loader, :examples, :labels

    def initialize(loader:)
      @loader = loader
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.estimate_for examples
    end
  end
end
