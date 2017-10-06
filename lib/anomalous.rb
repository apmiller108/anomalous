require 'anomalous/data'
require 'anomalous/detector'
require 'anomalous/gaussian_dist_params_estimate'
require 'anomalous/plot'
require 'anomalous/version'
require 'nmatrix'

module Anomalous
  def self.load(examples, **args)
    Detector.new(loader: Data::Loader.new(examples, args))
  end

  class AnomalousError < StandardError; end
end
