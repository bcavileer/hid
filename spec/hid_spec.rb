require 'spec_helper'

describe HID do
  let(:unknown)  { double 'Unknown' }
  let(:unknown2) { double 'Other Unknown' }
  let(:type)     { double 'Type' }
  let(:type2)    { double 'Other Type' }
  let(:identity) { double 'Identity' }

  before(:each) do
    HID::MemoryIdentifier.store = Hash.new
    HID::MemoryRecorder.store   = Hash.new
  end

  describe 'identified objects' do
    context 'without Type argument' do
      context 'nothing mapped' do
        it 'returns nil' do
          expect(HID.identify unknown).to be_nil
        end
      end

      context 'other mapped' do
        it 'returns nil' do
          HID.map 'other', identity
          expect(HID.identify unknown).to be_nil
        end
      end

      context 'Unknown mapped with Type' do
        it 'returns nil' do
          HID.map unknown, identity, type
          expect(HID.identify unknown).to be_nil
        end
      end

      context 'Unknown mapped without Type' do
        it 'returns Identity' do
          HID.map unknown, identity
          expect(HID.identify unknown).to eq identity
        end
      end
    end

    context 'with Type argument' do
      context 'nothing mapped' do
        it 'returns nil' do
          expect(HID.identify unknown, type).to be_nil
        end
      end

      context 'other mapped Type' do
        it 'returns nil' do
          HID.map unknown, identity, type
          expect(HID.identify unknown, type2).to be_nil
        end
      end

      context 'Unknown mapped' do
        it 'returns Identity' do
          HID.map unknown, identity, type
          expect(HID.identify unknown, type).to eq identity
        end
      end
    end
  end

  describe 'objects not identified' do
    context 'without Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Hash' do
          expect(HID.recorded).to eq({})
        end
      end

      context 'no Types' do
        it 'returns a Hash with key nil and value Array with item Unknown' do
          HID.identify unknown
          expect(HID.recorded).to eq nil => [unknown]
        end
      end

      context 'with Types' do
        it 'returns a Hash with key Type and value Array with item Unknown' do
          HID.identify unknown, type
          expect(HID.recorded).to eq type => [unknown]
        end
      end

      context 'with and without Types' do
        it 'returns full Hash' do
          HID.identify unknown
          HID.identify unknown2, type
          expect(HID.recorded).to eq nil => [unknown], type => [unknown2]
        end
      end
    end

    context 'with Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Array' do
          expect(HID.recorded type).to eq []
        end
      end

      context 'no Types' do
        it 'returns an empty Array' do
          HID.identify unknown
          expect(HID.recorded type).to eq []
        end
      end

      context 'with Types' do
        it 'returns Array with Unknown' do
          HID.identify unknown, type
          expect(HID.recorded type).to eq [unknown]
        end
      end

      context 'with multiple Types' do
        it 'returns Array with Unknown' do
          HID.identify unknown, type
          HID.identify unknown2, type2
          expect(HID.recorded type).to eq [unknown]
        end
      end
    end
  end
end
