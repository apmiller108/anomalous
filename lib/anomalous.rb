require 'anomalous/detector'
require 'anomalous/gaussian_dist_params_estimate'
require 'anomalous/loader'
require 'anomalous/plot'
require 'anomalous/version'
require 'nmatrix'

module Anomalous
  def self.load(data, labels, **args)
    Detector.new(loader: Loader.new(data, labels, args))
  end

  class AnomalousError < StandardError; end
end
