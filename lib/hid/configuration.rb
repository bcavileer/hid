module HID
  class Configuration
    attr_accessor :identifier, :recorder

    def initialize(persistence=:memory)
      case persistence
        when :memory
          require 'hid/persistence/memory/identifier'
          require 'hid/persistence/memory/recorder'
          @identifier = HID::Persistence::Memory::Identifier
          @recorder = HID::Persistence::Memory::Recorder
          @identifier.store = Hash.new
          @recorder.store = Hash.new
        when :active_record
          raise 'activerecord gem is required to use ActiveRecord persistence' unless defined?(::ActiveRecord)
          require 'hid/persistence/active_record/identifier'
          require 'hid/persistence/active_record/recorder'
          @identifier = HID::Persistence::ActiveRecord::Identifier
          @recorder = HID::Persistence::ActiveRecord::Recorder
        else
          raise "unknown internal persistence type #{persistence}"
      end
    end
  end
end
