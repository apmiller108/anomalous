require 'anomalous/version'
require 'nmatrix'

module Anomalous
  def self.load(file)
    NMatrix::IO::Matlab.load(file)
  end
end
