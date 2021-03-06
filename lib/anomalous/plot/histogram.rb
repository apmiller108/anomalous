require 'nyaplot'

module Anomalous
  module Plot
    class Histogram
      def initialize(features, options = {})
        @ith_feature = options[:ith_feature] || :all
        @dir         = options[:dir]         || 'histograms'
        @bins        = options[:bins]        || 100
        @features    = filter_feature_set(features)
      end

      def call
        @features.each_column.with_index do |column, index|
          plot = Nyaplot::Plot.new
          plot.add(:histogram, column.to_flat_array)
          plot.diagrams[0].options[:bin_num] = @bins
          Dir.mkdir(@dir) unless File.exists?(@dir)
          plot.export_html(histogram_file_path(index))
        end
        true
      end

      private

      def filter_feature_set(features)
        return features if @ith_feature == :all
        features[0..(features.rows - 1), @ith_feature]
      end

      def histogram_file_path(index)
        return "#{@dir}/feature#{index}.html" if @ith_feature == :all
        "#{@dir}/feature#{@ith_feature}.html"
      end
    end
  end
end
