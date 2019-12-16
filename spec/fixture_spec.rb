# frozen_string_literal: true

RSpec.describe Confixturable::Fixture do
  subject { described_class.new filename, format, options }
  let(:filename) { 'test' }
  let(:options) { { is_test: true } }
  let(:format) { :json }

  describe '.new' do
    context 'when no file can be found' do
      let(:filename) { 'non_existent' }

      it 'raises an error' do
        expect { subject }.to raise_error Confixturable::MissingFileError
      end
    end

    context 'when a nested filepath is given' do
      let(:filename) { 'nested_directory/alternate_fixture' }

      it 'finds the file' do
        expect { subject }.not_to raise_error
      end
    end
  end

  describe '#result' do
    it 'returns a string' do
      expect(subject.result).to be_a String
    end

    context 'when format is json' do
      it 'returns something that resembles json' do
        fixture = subject.result
        expect { JSON.parse(fixture) }.not_to raise_error
      end
    end
  end
end
