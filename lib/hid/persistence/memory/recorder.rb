module HID
  module Persistence
    module Memory
      class Recorder
        class << self
          attr_accessor :store

          def record(input, type)
            type_array = store[type] ||= []
            return if type_array.include? input
            type_array << input
            nil
          end

          def recorded(type)
            return store unless type
            store[type] || []
          end
        end
      end
    end
  end
end
