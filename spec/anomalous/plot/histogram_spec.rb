require 'spec_helper'

RSpec.describe Anomalous::Plot::Histogram do
  let(:examples) { N[[1, 2, 3], [3, 1, 2]] }

  after :each do
    FileUtils.rm_r("spec/histograms", force: true)
  end

  describe '.new' do
    context 'with default for ith_feature option' do
      subject do
        described_class.new(examples)
      end

      it 'intializes @features to a vector of the ith feature set' do
        expect(subject.instance_variable_get(:@features)).to eq examples
      end
    end

    context 'when overriding the ith_feature default with an Integer' do
      subject do
        described_class.new(examples, ith_feature: 1)
      end

      it 'intializes @features to a vector of the ith feature set' do
        expect(subject.instance_variable_get(:@features)).to eq examples[0..1, 1]
      end
    end
  end

  describe '.call' do
    context 'with default for ith_feature option' do
      it 'plots a histogram for all features' do
        described_class.new(examples, dir: 'spec/histograms').call

        expect(File.exists?('spec/histograms/feature0.html')).to be true
        expect(File.exists?('spec/histograms/feature1.html')).to be true
        expect(File.exists?('spec/histograms/feature2.html')).to be true
      end
    end

    context 'with default for dir option' do
      it 'writes histograms to /histograms directory' do
        described_class.new(examples).call

        expect(File.exists?('histograms/feature0.html')).to be true
        expect(File.exists?('histograms/feature1.html')).to be true
        expect(File.exists?('histograms/feature2.html')).to be true

        FileUtils.rm_r("histograms")
      end
    end

    context 'when overriding the ith_feature default with an Integer' do
      it 'writes a single histogram for the ith_feature' do
        described_class.new(examples,
                            ith_feature: 2,
                            dir: 'spec/histograms').call

        expect(File.exists?('spec/histograms/feature2.html')).to be true
      end
    end
  end
end
