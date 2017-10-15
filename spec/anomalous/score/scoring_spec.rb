require 'spec_helper'

RSpec.describe Anomalous::Score::Scoring do
  let(:y_labels) { N[[1], [1], [0]] }
  let(:pval) { N[[1], [2], [3]] }
  let(:epsilon) { 1.1 }

  subject do
    described_class.new(y_labels, pval, epsilon)
  end

  it 'calculates the precision' do
    expect(subject.precision).to eq 1.0
  end

  it 'calculates the recall' do
    expect(subject.recall).to eq 0.5
  end

  it 'calculates the F1 score' do
    expect(subject.f1.round(2)).to eq 0.67
  end
end
