require "spec_helper"

RSpec.describe Anomalous::Loader do
  describe '#initialize' do
    context 'with a Ruby Array' do
      it 'returns a NMatrix object' do
        loader = described_class.new([[0], [1]], :array)
        expect(loader.matrix).to be_instance_of(NMatrix)
      end

      it 'uses :array as the default data format' do
        loader = described_class.new([[0], [1]])
        expect(loader.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Matlab file' do
      let(:mat_file) { 'spec/sample_data/data.mat' }

      subject do
        described_class.new mat_file, :matlab
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Matrix Market file' do
      let(:mtx_file) { 'spec/sample_data/data.mtx' }

      subject do
        described_class.new mtx_file, :market
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Point Cloud file' do
      let(:pcd_file) { 'spec/sample_data/data.pcd' }

      subject do
        described_class.new pcd_file, :point_cloud
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with Harwell-Boeing file' do
      let(:rua_file) { 'spec/sample_data/data.rua' }

      subject do
        described_class.new rua_file, :harwell_boeing
      end

      it 'returns a NMatrix object' do
        expect(subject.matrix).to be_instance_of(NMatrix)
      end
    end

    context 'with unsupported file type' do
      it 'raises an exception' do
        expect { described_class.new('', :nope) }.to(
          raise_error(Anomalous::AnomalousError,
                      "Data format: 'nope' is not supported. "\
                      "Data format should be one of [:array, :harwell_boeing, "\
                      ":matlab, :market, :point_cloud]")
        )
      end
    end
  end
end
