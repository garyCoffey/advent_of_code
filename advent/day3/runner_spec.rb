# frozen_string_literal: true

require './advent/day3/runner'

describe 'RuckSack' do
  context '#result' do
    before do
      allow_any_instance_of(RuckSack).to receive(:file_path).and_return('./advent/day3/data/test_input.txt')
    end

    context 'part 1' do
      let(:result) { RuckSack.new.result.split("\n").first }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'rucksack should score 157' do
        let(:calculation) { result.split.last }

        it 'should be 157' do
          expect(calculation).to eq('157')
        end
      end
    end
    context 'part 2' do
      let(:result) { RuckSack.new.result.split("\n").last }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'rucksack should score 70' do
        let(:calculation) { result.split.last }

        it 'should be 70' do
          expect(calculation).to eq('70')
        end
      end
    end
  end
end
