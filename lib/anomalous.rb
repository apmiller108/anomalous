require 'anomalous/version'
require 'anomalous/loader'
require 'anomalous/detector'
require 'nmatrix'

module Anomalous
  def self.load(data, **args)
    Detector.new(loader: Loader.new(data, args[:data_format]))
  end

  class AnomalousError < StandardError; end
end
