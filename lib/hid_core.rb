require 'hid_core/version'
require 'hid_core/configuration'

module HidCore
  class << self
    attr_accessor :configuration

    def identify(unknown, type=nil)
      identity = find unknown, type
      return identity if identity
      record unknown, type
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
