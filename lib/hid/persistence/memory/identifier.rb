module HID
  module Persistence
    module Memory
      class Identifier
        class << self
          attr_accessor :store

          def find(input, type)
            (type_hash = store[type]) && type_hash[input]
          end

          def map(input, identity, type)
            type_hash = store[type] ||= Hash.new
            type_hash[input] = identity
            nil
          end
        end
      end
    end
  end
end
