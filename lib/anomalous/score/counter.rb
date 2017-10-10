module Anomalous
  module Score
    class Counter
      attr_reader :true_pos_count, :false_pos_count, :false_neg_count

      def initialize(y_labels, probabilities, epsilon)
        @true_pos_count  = 0.0
        @false_pos_count = 0.0
        @false_neg_count = 0.0
        @y_labels        = y_labels
        @probabilities   = probabilities
        @epsilon         = epsilon
        compute_counts
      end

      def compute_counts
        @probabilities.each.with_index do |val, index|
          if val < @epsilon && @y_labels[index] == 1
            @true_pos_count += 1
          elsif val < @epsilon && @y_labels[index].zero?
            @false_pos_count += 1
          elsif val >= @epsilon && @y_labels[index] == 1
            @false_neg_count += 1
          end
        end
      end
    end
  end
end
