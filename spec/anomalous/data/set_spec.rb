require 'spec_helper'

RSpec.describe Anomalous::Data::Set do
  let(:data) { NMatrix::IO::Matlab.load('spec/sample_data/sample.mat') }

  subject do
    described_class.new data
  end

  describe '#build_datasets' do
    it 'has :training_set that is 80% of non-anomalous examples' do
      expect(subject.training_set.rows).to eq 14_217
    end

    it 'has :training_set with only non-anomalous examples' do
      anomalous = subject.training_set.to_a.select { |e| e.last == 1 }

      expect(anomalous).to be_empty
    end

    it 'has :test_set that is 80% of non-anomalous examples' do
      normal = subject.test_set.to_a.select { |e| e.last.zero? }

      expect(normal.size).to eq 11_374
    end

    it 'has :test_set that is 80% of anomalous examples' do
      normal = subject.test_set.to_a.select { |e| e.last == 1 }

      expect(normal.size).to eq 21
    end

    it 'has :cross_val_set that has 20% of non-anomalous examples' do
      normal = subject.cross_val_set.to_a.select { |e| e.last.zero? }

      expect(normal.size).to eq 2843
    end

    it 'has :cross_val_set that has all anomalous examples' do
      anomalous = subject.cross_val_set.to_a.select { |e| e.last == 1 }

      expect(anomalous.size).to eq 5
    end
  end
end
