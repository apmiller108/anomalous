module Anomalous
  class GaussianDistParamsEstimate
    def self.estimate_for(examples)
      new examples.mean, examples.variance
    end

    attr_reader :mean, :variance

    def initialize(mean, variance)
      @mean     = mean
      @variance = variance
    end
  end
end