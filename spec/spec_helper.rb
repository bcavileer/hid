$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hid'
require 'examples/identifier'
require 'examples/recorder'

def create_test_doubles
  let(:input)    { double 'Input' }
  let(:input2)   { double 'Other Input' }
  let(:type)     { double 'Type' }
  let(:type2)    { double 'Other Type' }
  let(:identity) { double 'Identity' }
end
