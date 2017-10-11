module Anomalous
  class Epsilon
    def initialize(cross_val_set, pval)
      @y_labels = extract_lables(cross_val_set)
      @pval     = pval
    end

    def select_threshold
      scores = []
      flat_array.min.step(to: flat_array.max, by: step_size) do |epsilon|
        scores << [
          epsilon,
          Anomalous::Score::Scoring.new(@y_labels, @pval, epsilon).f1
        ]
      end
      scores
    end

    private

    def step_size
      (flat_array.max - flat_array.min) / 1000
    end

    def flat_array
      @flat_array ||= @pval.to_flat_array
    end

    def extract_lables(cross_val_set)
      m, k = cross_val_set.shape
      cross_val_set[0..(m - 1), k - 1]
    end
  end
end
