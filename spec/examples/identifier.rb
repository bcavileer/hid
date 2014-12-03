RSpec.shared_examples 'identifier' do
  describe 'identified Inputs' do
    create_test_doubles

    context 'without Type argument' do
      context 'nothing mapped' do
        it 'returns nil' do
          expect(
              HID.identify input
          ).to be_nil
        end
      end

      context 'other mapped' do
        it 'returns nil' do
          HID.map input2, identity

          expect(
              HID.identify input
          ).to be_nil
        end
      end

      context 'Input mapped with Type' do
        it 'returns nil' do
          HID.map input, identity, type

          expect(
              HID.identify input
          ).to be_nil
        end
      end

      context 'Input mapped without Type' do
        it 'returns Identity' do
          HID.map input, identity

          expect(
              HID.identify input
          ).to eq identity
        end
      end
    end

    context 'with Type argument' do
      context 'nothing mapped' do
        it 'returns nil' do
          expect(
              HID.identify input, type
          ).to be_nil
        end
      end

      context 'other mapped Type' do
        it 'returns nil' do
          HID.map input, identity, type

          expect(
              HID.identify input, type2
          ).to be_nil
        end
      end

      context 'Input mapped' do
        it 'returns Identity' do
          HID.map input, identity, type

          expect(
              HID.identify input, type
          ).to eq identity
        end
      end
    end
  end
end
