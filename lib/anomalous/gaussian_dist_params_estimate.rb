module Anomalous
  class GaussianDistParamsEstimate
    def self.estimate_for(examples)
      non_anomalous = N[
        *examples.to_a.delete_if { |example| example.last == 1 }
      ]
      new non_anomalous.mean, non_anomalous.variance
    end

    attr_reader :mean, :variance

    def initialize(mean, variance)
      @mean     = mean[0..-2]
      @variance = variance[0..-2]
    end
  end
end
