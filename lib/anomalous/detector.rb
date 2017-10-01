module Anomalous
  class Detector
    extend Forwardable

    def_delegator :@loader, :matrix

    def initialize(loader:)
      @loader = loader
    end

    def gaussian_params
      @gaussian_params ||= GaussianDistParamsEstimate.estimate_for matrix
    end
  end
end
