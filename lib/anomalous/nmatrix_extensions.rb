module Anomalous
  module NMatrixExtensions
    refine NMatrix do
      def variance(dimen = 0)
        reduce_dtype = integer_dtype? ? :float64 : nil
        m = mean(dimen)
        inject_rank(dimen, 0.0, reduce_dtype) do |var, sub_mat|
          var + (m - sub_mat) * (m - sub_mat) / shape[dimen]
        end
      end
    end
  end
end
