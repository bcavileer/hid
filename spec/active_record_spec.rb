require 'spec_helper'
require 'support/active_record'

describe 'ActiveRecord HidCore' do
  before(:each) do
    HidCore.configuration = HidCore::Configuration.new :active_record
    DatabaseCleaner.start
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  include_examples 'identifier'
  include_examples 'recorder'
end
