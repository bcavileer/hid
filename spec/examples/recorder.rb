RSpec.shared_examples 'recorder' do
  describe 'not identified Inputs' do
    context 'without Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Hash' do
          expect(
              HidCore.recorded
          ).to eq({})
        end
      end

      context 'no Types' do
        it 'returns a Hash with key nil and value Array with item Input' do
          HidCore.identify 'input'

          expect(
              HidCore.recorded
          ).to eq nil => ['input']
        end
      end

      context 'with Types' do
        it 'returns a Hash with key Type and value Array with item Input' do
          HidCore.identify 'input', 'type'

          expect(
              HidCore.recorded
          ).to eq 'type' => ['input']
        end
      end

      context 'with and without Types' do
        it 'returns full Hash' do
          HidCore.identify 'input'
          HidCore.identify 'input2', 'type'

          expect(
              HidCore.recorded
          ).to eq nil => ['input'], 'type' => ['input2']
        end
      end
    end

    context 'with Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Array' do
          expect(
              HidCore.recorded 'type'
          ).to eq []
        end
      end

      context 'no Types' do
        it 'returns an empty Array' do
          HidCore.identify 'input'

          expect(
              HidCore.recorded 'type'
          ).to eq []
        end
      end

      context 'with Types' do
        it 'returns Array with Input' do
          HidCore.identify 'input', 'type'

          expect(
              HidCore.recorded 'type'
          ).to eq ['input']
        end
      end

      context 'with multiple Types' do
        it 'returns Array with Input' do
          HidCore.identify 'input', 'type'
          HidCore.identify 'input2', 'type2'

          expect(
              HidCore.recorded 'type'
          ).to eq ['input']
        end
      end
    end
  end
end
