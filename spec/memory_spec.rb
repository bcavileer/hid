require 'spec_helper'

describe 'In-Memory HidCore' do
  # create new in-memory stores before each test
  before(:each) do
    HidCore.configuration = HidCore::Configuration.new :memory
  end

  include_examples 'identifier'
  include_examples 'recorder'
end
