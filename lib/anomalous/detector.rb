module Anomalous
  class Detector
    extend Forwardable

    def_delegator :@loader, :matrix

    def initialize(loader:)
      @loader = loader
    end
  end
end
