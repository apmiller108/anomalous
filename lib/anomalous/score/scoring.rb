module Anomalous
  module Score
    class Scoring
      attr_reader :counter

      def initialize(examples, probabilities, epsilon)
        @y_labels = examples[0..(examples.rows - 1), examples.cols - 1]
        @counter = Anomalous::Score::Counter.new(@y_labels,
                                                 probabilities,
                                                 epsilon)
      end

      def precision
        counter.true_pos_count /
          (counter.true_pos_count + counter.false_pos_count)
      end

      def recall
        counter.true_pos_count /
          (counter.true_pos_count + counter.false_neg_count)
      end

      def f1
        (2 * precision * recall) / (precision + recall)
      end
    end
  end
end
