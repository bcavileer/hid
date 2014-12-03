require 'spec_helper'

describe HID do
  # create new in-memory stores before each test
  before(:each) do
    HID.configure do |config|
      config.identifier.store = Hash.new
      config.recorder.store   = Hash.new
    end
  end

  include_examples 'identifier'
  include_examples 'recorder'
end
