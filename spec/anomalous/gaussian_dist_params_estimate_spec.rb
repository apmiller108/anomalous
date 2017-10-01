require 'spec_helper'

RSpec.describe Anomalous::GaussianDistParamsEstimate do
  let(:examples) { NMatrix::IO::Matlab.load('spec/sample_data/data.mat') }

  describe '.estimate_for' do
    subject do
      described_class.estimate_for(examples)
    end

    it 'returns an instance of GaussianDistParamsEstimate' do
      expect(subject).to be_instance_of Anomalous::GaussianDistParamsEstimate
    end

    it 'initializes the mean with an NMatrix object' do
      expect(subject.mean).to be_instance_of NMatrix
    end

    it 'calculates the mean' do
      expect(subject.mean.to_a).to eq [14.019297798587198, 15.037746995886762]
    end

    it 'initializes the variance with an NMatrix object' do
      expect(subject.variance).to be_instance_of NMatrix
    end

    it 'calculates the variance' do
      expect(subject.variance.to_a).to eq [2.526098328384123, 1.6313305054755667]
    end
  end
end
