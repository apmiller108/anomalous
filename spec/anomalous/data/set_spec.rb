require 'spec_helper'

RSpec.describe Anomalous::Data::Set do
  let(:examples) { NMatrix::IO::Matlab.load('spec/sample_data/sample.mat') }

  subject do
    described_class.new examples: examples
  end

  describe '#build_datasets' do
    context 'with default split value' do
      it 'has :training_set that is 80% of non-anomalous examples' do
        expect(subject.training_set.rows).to eq 11_374
      end

      it 'has :training_set with only non-anomalous examples' do
        anomalous = subject.training_set.to_a.select { |e| e.last == 1 }

        expect(anomalous).to be_empty
      end

      it 'has :test_set that is 10% of non-anomalous examples' do
        normal = subject.test_set.to_a.select { |e| e.last.zero? }

        expect(normal.size).to be_within(1).of(1422)
      end

      it 'has :test_set that is 50% of anomalous examples' do
        normal = subject.test_set.to_a.select { |e| e.last == 1 }

        expect(normal.size).to eq 13
      end

      it 'has :cross_val_set that has 10% of non-anomalous examples' do
        normal = subject.cross_val_set.to_a.select { |e| e.last.zero? }

        expect(normal.size).to be_within(1).of(1422)
      end

      it 'has :cross_val_set that has 50% of anomalous examples' do
        anomalous = subject.cross_val_set.to_a.select { |e| e.last == 1 }

        expect(anomalous.size).to eq 13
      end
    end
  end
end
