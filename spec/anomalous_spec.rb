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

    let :p_xval do
      Anomalous::ProbabilityDensity.call(xval, gaussian_params)
    end

    it 'finds the correct threshold and f1 score' do
      epsilon = Anomalous::Epsilon.new(xval, p_xval)

      expect(epsilon.select_threshold).to eq [
                                            1.3772288907613558e-18,
                                            0.6153846153846154
                                          ]
    end

    xit 'detects anomalies' do
      # p_examples = Anomalous::ProbabilityDensity.call(examples, gaussian_params)
    end
  end
end
