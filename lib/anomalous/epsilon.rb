module Anomalous
  class Epsilon
    def initialize(examples, probabilities)
      @y_labels = extract_lables(examples)
      @prob     = probabilities
    end

    def select_threshold
      flat_array
        .min
        .step(to: flat_array.max, by: step_size)
        .each_with_object([], &method(:collect_scores))
        .delete_if(&method(:f1_is_nan?))
        .sort(&method(:by_f1_score_desc))
        .last
    end

    private

    def by_f1_score_desc(x, y)
      x[1] <=> y[1]
    end

    def f1_is_nan?(array)
      array[1].nan?
    end

    def collect_scores(epsilon, array)
      array << [
        epsilon,
        Anomalous::Score::Scoring.new(@y_labels, @prob, epsilon).f1
      ]
    end

    def step_size
      (flat_array.max - flat_array.min) / 1000
    end

    def flat_array
      @flat_array ||= @prob.to_flat_array
    end

    def extract_lables(cross_val_set)
      m, k = cross_val_set.shape
      cross_val_set[0..(m - 1), k - 1]
    end
  end
end
