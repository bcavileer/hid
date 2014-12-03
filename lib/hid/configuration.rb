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
        when :sqlite
          require 'hid/persistence/sqlite/identifier'
          require 'hid/persistence/sqlite/recorder'
          @identifier = HID::Persistence::Sqlite::Identifier
          @recorder = HID::Persistence::Sqlite::Recorder
        else
          raise "unknown internal persistence type #{persistence}"
      end
    end
  end
end
