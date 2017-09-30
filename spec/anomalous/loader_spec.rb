require "spec_helper"

RSpec.describe Anomalous::Loader do
  describe '#initialize' do
    context 'with Matlab file' do
      let(:mat_file) { 'spec/sample_data/data.mat' }

      subject do
        described_class.new mat_file, data_format: :matlab
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Matrix Market file' do
      let(:mtx_file) { 'spec/sample_data/data.mtx' }

      subject do
        described_class.new mtx_file, data_format: :market
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Point Cloud file' do
      let(:pcd_file) { 'spec/sample_data/data.pcd' }

      subject do
        described_class.new pcd_file, data_format: :point_cloud
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Harwell-Boeing file' do
      let(:rua_file) { 'spec/sample_data/data.rua' }

      subject do
        described_class.new rua_file, data_format: :harwell_boeing
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end
  end
end
