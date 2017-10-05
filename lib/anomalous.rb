require 'anomalous/detector'
require 'anomalous/gaussian_dist_params_estimate'
require 'anomalous/loader'
require 'anomalous/plot'
require 'anomalous/version'
require 'nmatrix'

module Anomalous
  def self.load(x:, y:, x_val:, y_val:, **args)
    Detector.new(loader: Loader.new(x, y, x_val, y_val, args))
  end

  class AnomalousError < StandardError; end
end
