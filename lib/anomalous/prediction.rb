module Anomalous
  class Prediction
    def initialize(examples, epsilon, gaussian_params)
      @examples        = examples
      @epsilon         = epsilon
      @gaussian_params = gaussian_params
    end

    def call
      probabilities.each_with_indices.with_object([]) do |(prob, index), array|
        array << index if prob < @epsilon
      end
    end

    private

    def probabilities
      Anomalous::ProbabilityDensity.call(@examples, @gaussian_params)
    end
  end
end
