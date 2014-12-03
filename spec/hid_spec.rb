require 'spec_helper'

describe HID do
  let(:identifier) { HID.configuration.identifier }
  let(:recorder)   { HID.configuration.recorder }

  # create new in-memory stores before each test
  before(:each) do
    identifier.store = Hash.new
    recorder.store   = Hash.new
  end

  let(:input)    { double 'Input' }
  let(:input2)   { double 'Other Input' }
  let(:type)     { double 'Type' }
  let(:type2)    { double 'Other Type' }
  let(:identity) { double 'Identity' }

  describe 'identified Inputs' do
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
          HID.identify input

          expect(
              HID.recorded
          ).to eq nil => [input]
        end
      end

      context 'with Types' do
        it 'returns a Hash with key Type and value Array with item Input' do
          HID.identify input, type

          expect(
              HID.recorded
          ).to eq type => [input]
        end
      end

      context 'with and without Types' do
        it 'returns full Hash' do
          HID.identify input
          HID.identify input2, type

          expect(
              HID.recorded
          ).to eq nil => [input], type => [input2]
        end
      end
    end

    context 'with Type argument' do
      context 'nothing recorded' do
        it 'returns an empty Array' do
          expect(
              HID.recorded type
          ).to eq []
        end
      end

      context 'no Types' do
        it 'returns an empty Array' do
          HID.identify input

          expect(
              HID.recorded type
          ).to eq []
        end
      end

      context 'with Types' do
        it 'returns Array with Input' do
          HID.identify input, type

          expect(
              HID.recorded type
          ).to eq [input]
        end
      end

      context 'with multiple Types' do
        it 'returns Array with Input' do
          HID.identify input, type
          HID.identify input2, type2

          expect(
              HID.recorded type
          ).to eq [input]
        end
      end
    end
  end
end
