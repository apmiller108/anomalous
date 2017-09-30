require 'anomalous/version'
require 'anomalous/loader'
require 'anomalous/detector'
require 'nmatrix'

module Anomalous
  def self.load(data, data_format: :array)
    Detector.new(data: Loader.new(data, data_format: data_format))
  end
end
