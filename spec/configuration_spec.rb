# frozen_string_literal: true

RSpec.describe Confixturable::Configuration do
  describe '#fixture_path' do
    it 'default value is spec/fixtures' do
      expect(described_class.new.fixture_path).to eq 'spec/fixtures'
    end
  end

  describe '#fixture_path=' do
    it 'can set value' do
      config = described_class.new
      config.fixture_path = 'spec/fixtures/nested_directory'
      expect(config.fixture_path).to eq 'spec/fixtures/nested_directory'
    end
  end
end
