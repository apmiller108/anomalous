require "spec_helper"

RSpec.describe Anomalous::Loader do
  describe '#initialize' do
    context 'with a Ruby Array' do
      subject do
        described_class.new([[0], [1]], [[0], [1]], data_format: :array)
      end

      it 'initializes @examples to a NMatrix object' do
        expect(subject.examples).to be_instance_of(NMatrix)
      end

      it 'initializes @labels to a NMatrix object' do
        expect(subject.labels).to be_instance_of(NMatrix)
      end

      it 'uses :array as the default data format' do
        loader = described_class.new([[0], [1]], [[0], [1]])

        expect(loader.examples).to be_instance_of(NMatrix)
        expect(loader.labels).to be_instance_of(NMatrix)
      end
    end

    context 'with Matlab file' do
      let(:mat_file) { 'spec/sample_data/data.mat' }

      subject do
        described_class.new mat_file, mat_file, data_format: :matlab
      end

      it 'initializes @examples to a NMatrix object' do
        expect(subject.examples).to be_instance_of(NMatrix)
      end

      it 'initializes @labels to a NMatrix object' do
        expect(subject.labels).to be_instance_of(NMatrix)
      end
    end

    context 'with Matrix Market file' do
      let(:mtx_file) { 'spec/sample_data/data.mtx' }

      subject do
        described_class.new mtx_file, mtx_file, data_format: :market
      end

      it 'initializes @examples to a NMatrix object' do
        expect(subject.examples).to be_instance_of(NMatrix)
      end

      it 'initializes @labels to a NMatrix object' do
        expect(subject.labels).to be_instance_of(NMatrix)
      end
    end

    context 'with Point Cloud file' do
      let(:pcd_file) { 'spec/sample_data/data.pcd' }

      subject do
        described_class.new pcd_file, pcd_file, data_format: :point_cloud
      end

      it 'initializes @examples to a NMatrix object' do
        expect(subject.examples).to be_instance_of(NMatrix)
      end

      it 'initializes @labels to a NMatrix object' do
        expect(subject.labels).to be_instance_of(NMatrix)
      end
    end

    context 'with Harwell-Boeing file' do
      let(:rua_file) { 'spec/sample_data/data.rua' }

      subject do
        described_class.new rua_file, rua_file, data_format: :harwell_boeing
      end

      it 'initializes @examples to a NMatrix object' do
        expect(subject.examples).to be_instance_of(NMatrix)
      end

      it 'initializes @labels to a NMatrix object' do
        expect(subject.labels).to be_instance_of(NMatrix)
      end
    end

    context 'with unsupported file type' do
      it 'raises an exception' do
        expect { described_class.new('', '', data_format: :nope) }.to(
          raise_error(Anomalous::AnomalousError,
                      "Data format: 'nope' is not supported. "\
                      "Data format should be one of [:array, :harwell_boeing, "\
                      ":matlab, :market, :point_cloud]")
        )
      end
    end
  end
end
