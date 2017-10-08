module Anomalous
  module Score
    class F1
      def self.call(examples, probabilities, epsilon)
        labels = examples[0..(examples.rows - 1), examples.cols - 1]
        counter = Anomalous::Score::Counter.new(labels,
                                                probabilities,
                                                epsilon).compute_counts

        precision = counter.true_pos_count / (counter.true_pos_count + counter.false_pos_count)
        recall    = counter.true_pos_count / (counter.true_pos_count + counter.false_neg_count)

        (2 * precision * recall) / (precision + recall)
      end
    end
  end
end
