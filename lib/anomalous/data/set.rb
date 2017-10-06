module Anomalous
  module Data
    class Set
      attr_reader :training_set, :test_set, :cross_val_set

      def initialize(examples)
        @training_set, @test_set, @cross_val_set = build_datasets(examples)
      end

      def build_datasets(examples)
        partitioned = examples.to_a.partition { |example| example.last.zero? }
        build_nmatrices(*partitioned, 0.8)
      end

      def build_nmatrices(normal, outliers, percent)
        normal_split  = (normal.size * percent).round
        outlier_split = (outliers.size * percent).round
        [
          normal,
          normal[0..(normal_split - 1)].concat(outliers[0..(outlier_split - 1)]),
          normal[normal_split..-1].concat(outliers[outlier_split..-1])
        ].map { |array| N[*array] }
      end
    end
  end
end
