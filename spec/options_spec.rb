# frozen_string_literal: true

RSpec.describe Confixturable::Options do
  subject { described_class.new opts, format }
  let(:opts) { { real_key: true, tacos: 'are delicious' } }

  describe '#fetch' do
    context 'when format is json' do
      let(:format) { :json }

      it 'returns a jsonified value if found' do
        expect(subject.fetch(:tacos)).to eq opts[:tacos].to_json
      end

      context 'and no value is found' do
        context 'and no default is provided' do
          it 'returns a jsonified null value' do
            expect(subject.fetch(:sandwiches)).to eq JSON.generate(nil)
          end
        end

        context 'and a default value is provided' do
          it 'returns the default converted to_json' do
            expect(subject.fetch(:sandwiches, 'are good too')).to eq('are good too'.to_json)
          end
        end
      end
    end

    context 'when the format is anything else' do
      let(:format) { :xml }

      it 'returns a value if found' do
        expect(subject.fetch(:tacos)).to eq opts[:tacos]
      end

      context 'and no value is found' do
        context 'and no default is provided' do
          it 'returns nil' do
            expect(subject.fetch(:sandwiches)).to eq nil
          end
        end

        context 'and a default value is provided' do
          it 'returns the default ' do
            expect(subject.fetch(:sandwiches, 'are good too')).to eq 'are good too'
          end
        end
      end
    end
  end
end
