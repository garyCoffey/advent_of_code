# frozen_string_literal: true

require './advent/day3/runner'

describe 'RuckSack' do
  context '#result' do
    context 'part 1' do
      let(:result) { RuckSack.new.result.split("\n").first }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context.skip 'strategy should score 15' do
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
