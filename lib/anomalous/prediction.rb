module Anomalous
  class Prediction
    def initialize(examples, epsilon, gaussian_params)
      @examples        = examples
      @epsilon         = epsilon
      @gaussian_params = gaussian_params
    end

    def call
      prob = Anomalous::ProbabilityDensity.call(@examples, @gaussian_params)

      prob.each_with_indices do |p, i|
        puts i if p < @epsilon
      end
    end
  end
end
