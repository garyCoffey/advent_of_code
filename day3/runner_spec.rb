# frozen_string_literal: true

require './day2/runner'

describe 'Day2' do
  context '#result' do
    context 'part 1' do
      let(:result) { Day2.new.result.split("\n").first }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'strategy should score 15' do
        before do
          allow_any_instance_of(Day2).to receive(:file_path).and_return('./day2/data/test_data_part1.txt')
        end

        let(:calculation) { result.split.last }

        it 'should be 10' do
          expect(calculation).to eq('15')
        end
      end
    end
  end
end
