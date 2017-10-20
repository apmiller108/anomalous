require 'spec_helper'

RSpec.describe Anomalous::Data::Set do
  let(:examples) { NMatrix::IO::Matlab.load('spec/sample_data/sample.mat') }

  describe '#build_datasets' do
    context 'with default split value' do
      subject do
        described_class.new examples: examples
      end

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

    context 'with split override of 0.6' do
      subject do
        described_class.new examples: examples, split: 0.6
      end

      it 'has :training_set that is 60% of non-anomalous examples' do
        expect(subject.training_set.rows).to eq 8530
      end

      it 'has :training_set with only non-anomalous examples' do
        anomalous = subject.training_set.to_a.select { |e| e.last == 1 }

        expect(anomalous).to be_empty
      end

      it 'has :test_set that is 20% of non-anomalous examples' do
        normal = subject.test_set.to_a.select { |e| e.last.zero? }

        expect(normal.size).to be_within(1).of(2844)
      end

      it 'has :test_set that is 50% of anomalous examples' do
        normal = subject.test_set.to_a.select { |e| e.last == 1 }

        expect(normal.size).to eq 13
      end

      it 'has :cross_val_set that has 20% of non-anomalous examples' do
        normal = subject.cross_val_set.to_a.select { |e| e.last.zero? }

        expect(normal.size).to be_within(1).of(2844)
      end

      it 'has :cross_val_set that has 50% of anomalous examples' do
        anomalous = subject.cross_val_set.to_a.select { |e| e.last == 1 }

        expect(anomalous.size).to eq 13
      end
    end
  end
end
