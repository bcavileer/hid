require 'hid/version'
require 'hid/memory_identifier'
require 'hid/memory_recorder'
require 'hid/configuration'

module HID
  class << self
    attr_accessor :configuration

    def identify(unknown, type=nil)
      identity = find unknown, type

      if identity
        identity
      else
        record unknown, type
      end
    end

    def map(unknown, identity, type=nil)
      configuration.identifier.map unknown, identity, type
    end

    def recorded(type=nil)
      configuration.recorder.recorded type
    end

    def configure
      yield configuration
    end

    private

    def find(unknown, type)
      configuration.identifier.find unknown, type
    end

    def record(unknown, type)
      configuration.recorder.record unknown, type
    end
  end

  self.configuration ||= Configuration.new
end
