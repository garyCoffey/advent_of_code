# frozen_string_literal: true

require './advent/day5/runner'

describe 'CraneOperator' do
  context '#result' do
    before do
      stub_const('CraneOperator::DATAFILEPATH', test_path)
    end

    let(:result) { CraneOperator.new.result.split("\n") }
    let(:test_path) { './advent/day5/data/test_input.txt' }
    context.skip 'part 1' do
      context 'suggested spec' do
        let(:part1) { result.first }

        it 'should be a string' do
          expect(part1.class).to eq(String)
        end

        context 'crates moved properly' do
          let(:top_row_crates) { part1.split.last }

          it 'should be CMZ' do
            expect(top_row_crates).to eq('CMZ')
          end
        end
      end
      context 'more intense spec' do
        let(:test_path) { './advent/day5/data/test_input2.txt' }
        let(:part1) { result.first }

        it 'should be a string' do
          expect(part1.class).to eq(String)
        end

        context 'crates moved properly' do
          let(:top_row_crates) { part1.split.last }

          it 'should be BBHJRVWZ' do
            expect(top_row_crates).to eq('BBHJRVWZ')
          end
        end
      end
    end
    context 'part 2' do
      context.skip 'suggested spec' do
        let(:part2) { result.last }

        it 'should be a string' do
          expect(part2.class).to eq(String)
        end

        context 'crates moved properly' do
          let(:top_row_crates) { part2.split.last }

          it 'should be MCD' do
            expect(top_row_crates).to eq('MCD')
          end
        end
      end
      context 'more intense spec' do
        let(:test_path) { './advent/day5/data/test_input3.txt' }
        let(:part2) { result.last }

        it 'should be a string' do
          expect(part2.class).to eq(String)
        end

        context 'crates moved properly' do
          let(:top_row_crates) { part2.split.last }

          it 'should be FFQJWWBW' do
            # require 'pry'; binding.pry
            expect(top_row_crates).to eq('FFQJWWBW')
          end
        end
      end
    end
  end
end
