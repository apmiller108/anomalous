module Anomalous
  module Score
    class Scoring
      attr_reader :counter

      def initialize(y_labels, pval, epsilon)
        @counter = Anomalous::Score::Counter.new(y_labels,
                                                 pval,
                                                 epsilon)
      end

      def scores
        {
          f1: f1,
          precision: precision,
          recall: recall
        }
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
