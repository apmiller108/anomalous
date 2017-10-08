require 'spec_helper'

RSpec.describe Anomalous::Score::F1 do
  let(:examples) { N[[1, 1], [2, 1], [3, 0]] }
  let(:probabilities) { N[[1], [2], [3]] }
  let(:epsilon) { 1.1 }

  it 'calculates the F1 score' do
    expect(
      described_class.call(examples, probabilities, epsilon).round(2)
    ).to eq 0.67
  end
end
