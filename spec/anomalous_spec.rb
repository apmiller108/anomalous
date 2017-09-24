require "spec_helper"

RSpec.describe Anomalous do
  it "has a version number" do
    expect(Anomalous::VERSION).not_to be nil
  end

  describe '.load' do
    let(:file) { 'spec/sample_data.mat' }

    it 'returns a NMatrix object' do
      expect(described_class.load(file)).to be_instance_of(NMatrix)
    end
  end
end
