require 'nmatrix'
require 'anomalous/nmatrix_extensions'
require 'anomalous/data'
require 'anomalous/detector'
require 'anomalous/gaussian_dist_params_estimate'
require 'anomalous/plot'
require 'anomalous/probability_density'
require 'anomalous/score'
require 'anomalous/version'

module Anomalous
  def self.load(examples, **args)
    Detector.new(loader: Data::Loader.new(examples, args))
  end

  class AnomalousError < StandardError; end
end
