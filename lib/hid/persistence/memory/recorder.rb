module HID
  module Persistence
    module Memory
      class Recorder
        @store = Hash.new

        class << self
          attr_accessor :store

          def record(input, type)
            type_array = store[type] ||= []

            unless type_array.include? input
              type_array << input
            end

            nil
          end

          def recorded(type)
            if type
              store[type] || []
            else
              store
            end
          end
        end
      end
    end
  end
end
