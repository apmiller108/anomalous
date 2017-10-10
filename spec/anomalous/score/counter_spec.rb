require 'spec_helper'

RSpec.describe Anomalous::Score::Counter do
  let(:y_labels) { N[[1], [1], [0], [0]] }
  let(:probabilities) { N[[1], [2], [1.01], [4]] }
  let(:epsilon) { 1.1 }

  subject do
    described_class.new(y_labels, probabilities, epsilon)
  end

  it 'counts the number of true positives' do
    expect(subject.true_pos_count).to eq 1
  end

  it 'counts the number of false positives' do
    expect(subject.false_pos_count).to eq 1
  end

  it 'counts the number of false negatives' do
    expect(subject.false_neg_count).to eq 1
  end
end
