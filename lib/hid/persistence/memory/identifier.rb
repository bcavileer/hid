module HID
  module Persistence
    module Memory
      class Identifier
        @store = Hash.new

        class << self
          attr_accessor :store

          def find(unknown, type)
            if (type_hash = store[type])
              type_hash[unknown]
            end
          end

          def map(unknown, identity, type)
            type_hash         = store[type] ||= Hash.new
            type_hash[unknown] = identity
            nil
          end
        end
      end
    end
  end
end
