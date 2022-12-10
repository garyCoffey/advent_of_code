# frozen_string_literal: true

require './advent/day1/runner'

describe 'Day1' do
  context '#result' do
    context 'part 1' do
      let(:result) { Day1.new.result.split("\n").first }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'calories should be 24000' do
        before do
          allow_any_instance_of(Day1).to receive(:file_path).and_return('./advent/day1/data/test.txt')
        end

        let(:calories) { result.split.last }

        it 'should be 24000' do
          expect(calories).to eq('24000')
        end
      end
    end
  end
end
