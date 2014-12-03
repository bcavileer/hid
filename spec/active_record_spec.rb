require 'spec_helper'
require 'support/active_record'

ACTIVE_RECORD_CONFIG =

describe 'ActiveRecord HID' do
  before(:each) do
    HID.configuration = HID::Configuration.new :active_record
    DatabaseCleaner.start
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  include_examples 'identifier'
  include_examples 'recorder'
end
