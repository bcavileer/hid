module HID
  class Configuration
    attr_accessor :identifier, :recorder

    def initialize
      @identifier = MemoryIdentifier
      @recorder   = MemoryRecorder
    end
  end
end
