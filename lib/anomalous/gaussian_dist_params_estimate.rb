module Anomalous
  class GaussianDistParamsEstimate
    using Anomalous::NMatrixExtensions

    attr_reader :mean, :variance

    def self.call(examples)
      new examples.mean, examples.variance
    end

    def initialize(mean, variance)
      @mean     = mean[0..-2]
      @variance = variance[0..-2]
    end
  end
end
