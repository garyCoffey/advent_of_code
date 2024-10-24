# frozen_string_literal: true

require './advent/day4/runner'

describe 'CleaningSections' do
  context '#result' do
    before do
      stub_const('CleaningSections::DATAFILEPATH', './advent/day4/data/test_input.txt')
    end

    let(:result) { CleaningSections.new.result.split("\n") }
    context 'part 1' do
      let(:part1) { result.first }

      it 'should be a string' do
        expect(part1.class).to eq(String)
      end

      context '2 overlapped sections' do
        let(:subsets) { part1.split.last }

        it 'should be 2' do
          expect(subsets).to eq('2')
        end
      end
    end
    context 'part 2' do
      let(:part2) { result.last }

      it 'should be a string' do
        expect(part2.class).to eq(String)
      end

      context '4 overlapping sections' do
        let(:overlapping_sections) { part2.split.last }

        it 'should be 4' do
          expect(overlapping_sections).to eq('4')
        end
      end
    end
  end
end
