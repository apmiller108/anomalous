require "spec_helper"

RSpec.describe Anomalous do
  it "has a version number" do
    expect(Anomalous::VERSION).not_to be nil
  end

  describe 'test case' do
    let :examples do
      NMatrix::IO::Matlab.load('spec/sample_data/test_case/examples.mat')
    end

    let :gaussian_params do
      Anomalous::GaussianDistParamsEstimate.call(examples)
    end

    let :xval do
      NMatrix::IO::Matlab.load('spec/sample_data/test_case/xval.mat')
    end

    subject do
      Anomalous::Epsilon.new(xval, gaussian_params)
    end

    it 'finds the correct threshold' do
      expect(subject.threshold[0]).to eq 1.3772288907613558e-18
    end

    it 'returns the f1, precision, and recall scores as a hash' do
      expect(subject.threshold[1]).to eq f1: 0.6153846153846154,
                                                precision: 0.5,
                                                recall: 0.8
    end
  end
end
