require 'spec_helper'

describe 'In-Memory HID' do
  # create new in-memory stores before each test
  before(:each) do
    HID.configuration = HID::Configuration.new :memory
  end

  include_examples 'identifier'
  include_examples 'recorder'
end
