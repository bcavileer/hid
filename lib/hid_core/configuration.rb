module HidCore
  class Configuration
    attr_accessor :identifier, :recorder

    def initialize(persistence=:memory)
      case persistence
        when :memory
          require 'hid_core/persistence/memory/identifier'
          require 'hid_core/persistence/memory/recorder'
          @identifier = HidCore::Persistence::Memory::Identifier
          @recorder = HidCore::Persistence::Memory::Recorder
          @identifier.store = Hash.new
          @recorder.store = Hash.new
        when :active_record
          raise 'activerecord gem is required to use ActiveRecord persistence' unless defined?(::ActiveRecord)
          require 'hid_core/persistence/active_record/identifier'
          require 'hid_core/persistence/active_record/recorder'
          @identifier = HidCore::Persistence::ActiveRecord::Identifier
          @recorder = HidCore::Persistence::ActiveRecord::Recorder
        else
          raise "unknown internal persistence type #{persistence}"
      end
    end
  end
end
