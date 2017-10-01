require 'spec_helper'

RSpec.describe Anomalous::Plot::Histogram do
  let!(examples) { N[[1, 2, 3], [3, 1, 2]] }
  describe '.call' do
    context 'with default for ith_feature option' do
      it 'plots a histogram from all features' do
        described_class.new(examples, dir: 'spec/histograms')

        expect(File.exists?('spec/histograms/feature0.html')).to be_true
      end
    end
  end
end
