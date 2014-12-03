RSpec.shared_examples 'recorder' do
  describe 'not identified Inputs' do
    context 'without Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Hash' do
          expect(
              HID.recorded
          ).to eq({})
        end
      end

      context 'no Types' do
        it 'returns a Hash with key nil and value Array with item Input' do
          HID.identify 'input'

          expect(
              HID.recorded
          ).to eq nil => ['input']
        end
      end

      context 'with Types' do
        it 'returns a Hash with key Type and value Array with item Input' do
          HID.identify 'input', 'type'

          expect(
              HID.recorded
          ).to eq 'type' => ['input']
        end
      end

      context 'with and without Types' do
        it 'returns full Hash' do
          HID.identify 'input'
          HID.identify 'input2', 'type'

          expect(
              HID.recorded
          ).to eq nil => ['input'], 'type' => ['input2']
        end
      end
    end

    context 'with Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Array' do
          expect(
              HID.recorded 'type'
          ).to eq []
        end
      end

      context 'no Types' do
        it 'returns an empty Array' do
          HID.identify 'input'

          expect(
              HID.recorded 'type'
          ).to eq []
        end
      end

      context 'with Types' do
        it 'returns Array with Input' do
          HID.identify 'input', 'type'

          expect(
              HID.recorded 'type'
          ).to eq ['input']
        end
      end

      context 'with multiple Types' do
        it 'returns Array with Input' do
          HID.identify 'input', 'type'
          HID.identify 'input2', 'type2'

          expect(
              HID.recorded 'type'
          ).to eq ['input']
        end
      end
    end
  end
end
