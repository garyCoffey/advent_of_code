# frozen_string_literal: true

require './advent/2023/day1/runner'

describe 'Trebuchet' do
  let(:trebuchet) { Trebuchet.new }
  context '#result' do
    before do
      allow_any_instance_of(Trebuchet).to receive(:file_path).and_return('./advent/2023/day1/data/test.txt')
    end
    context 'part 1' do
      before do
        allow_any_instance_of(Trebuchet).to receive(:file_path).and_return('./advent/2023/day1/data/test.txt')
      end

      let(:result) { trebuchet.part_1_result }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'calibration_count should be 142' do
        let(:calibration_count) { result.split.last }

        it 'should be 142' do
          expect(calibration_count).to eq('142')
        end
      end
    end

    context 'part 2' do
      before do
        allow_any_instance_of(Trebuchet).to receive(:file_path).and_return('./advent/2023/day1/data/part2_test.txt')
      end

      let(:result) { trebuchet.part_2_result }

      it 'should be a string' do
        expect(result.class).to eq(String)
      end

      context 'calibration_count should be 281' do
        let(:calibration_count) { result.split.last }

        it 'should be 281' do
          expect(calibration_count).to eq('281')
        end
      end
    end
  end
end
