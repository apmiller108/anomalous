module Anomalous
  class ProbabilityDensity
    def self.call(examples, gaussian_params)
      k = gaussian_params.mean.size
      m = examples.rows

      sigma2 =
        if gaussian_params.variance.cols == 1 || gaussian_params.variance.rows == 1
          NMatrix.diag(gaussian_params.variance.to_a)
        else
          gaussian_params.variance
        end

      examples = examples.slice(0..(m - 1), 0..(k - 1))

      examples.each_row.with_index do |row, index|
        examples[index, 0..(k - 1)] = row - gaussian_params.mean
      end

      s = ((2 * Math::PI)**(-k / 2.0) * (sigma2.det**-0.5))

      x = (examples.dot(sigma2.inverse) * examples).sum(1).map do |e|
        Math.exp(-0.5 * e)
      end

      x * s
    end
  end
end
