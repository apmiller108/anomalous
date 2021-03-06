require 'spec_helper'

RSpec.describe Anomalous::GaussianDistParamsEstimate do
  let :examples do
    N[[1, 2, 3, 0], [5, 6, 7, 0]]
  end

  describe '.call' do
    subject do
      described_class.call(examples)
    end

    it 'returns an instance of GaussianDistParamsEstimate' do
      expect(subject).to be_instance_of Anomalous::GaussianDistParamsEstimate
    end

    it 'initializes the mean with an NMatrix object' do
      expect(subject.mean).to be_instance_of NMatrix
    end

    it 'calculates the mean' do
      expect(subject.mean.to_a).to eq [3.0, 4.0, 5.0]
    end

    it 'initializes the variance with an NMatrix object' do
      expect(subject.variance).to be_instance_of NMatrix
    end

    it 'calculates the variance' do
      expect(subject.variance.to_a).to eq [4.0, 4.0, 4.0]
    end
  end
end
