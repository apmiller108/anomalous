module Anomalous
  module Data
    class Set
      attr_reader :training_set, :test_set, :cross_val_set

      def initialize(examples:, split: 0.8)
        @split = split
        build_datasets(examples)
      end

      def build_datasets(examples)
        partitioned = examples.to_a.partition { |example| example.last.zero? }
        @training_set, @cross_val_set, @test_set = build_nmatrices(*partitioned)
      end

      private

      def build_nmatrices(normal, outliers)
        split_index          = (normal.size * @split).round
        normal_training      = normal[0..(split_index - 1)]
        normal_partitioned   = halve_set(normal[split_index..-1])
        outliers_partitioned = halve_set(outliers)

        [
          normal_training,
          normal_partitioned[0].concat(outliers_partitioned[0]),
          normal_partitioned[1].concat(outliers_partitioned[1])
        ].map { |array| N[*array] }
      end

      def halve_set(examples)
        examples.partition.with_index { |_, index| index < examples.size / 2 }
      end
    end
  end
end
