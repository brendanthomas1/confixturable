# frozen_string_literal: true

RSpec.describe Confixturable do
  it 'has a version number' do
    expect(Confixturable::VERSION).not_to be nil
  end

  describe '.configure' do
    before do
      Confixturable.configure do |config|
        config.fixture_path = 'spec/fixtures/nested_directory'
      end
    end

    it 'finds the fixture in the configurable path' do
      expect(described_class.create('alternate_fixture')).to be_a String
    end

    after { Confixturable.configuration = Confixturable::Configuration.new }
  end

  describe '.create' do
    it 'returns a string' do
      expect(described_class.create('test')).to be_a String
    end

    context 'when format is json' do
      it 'returns something that resembles json' do
        fixture = described_class.create('test', format: :json)
        expect { JSON.parse(fixture) }.not_to raise_error
      end
    end

    context 'when no format is given' do
      it 'returns json' do
        fixture = described_class.create('test')
        expect { JSON.parse(fixture) }.not_to raise_error
      end
    end
  end
end
