require 'spec_helper'

RSpec.describe Anomalous::ProbabilityDensity do
  let(:data) { NMatrix::IO::Matlab.load 'spec/sample_data/sample2.mat' }
  let(:gaussian_params) { Anomalous::GaussianDistParamsEstimate.call(data) }

  subject do
    described_class.call data, gaussian_params
  end

  it 'returns an NMatrix object' do
    expect(subject).to be_instance_of NMatrix
  end

  it 'returns a vector of probability sums for each example' do
    expect(subject.shape).to eq [data.rows, 1]
  end

  it 'calculates the sum probabilities of all features' do
    expect(subject[0, 0]).to eq 7.433929464694885e-18
    expect(subject[499, 0]).to eq 1.8009073894039984e-16
    expect(subject[999, 0]).to eq 1.6632710525560194e-16
  end
end
