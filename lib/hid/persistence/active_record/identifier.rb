module HID
  module Persistence
    module ActiveRecord
      class Identifier
        class << self
          def find(input, type)
            identity = Identities.where(input: input, id_type: type).first
            identity && identity.identity
          end

          def map(input, identity, type)
            Identities.create input: input, identity: identity, id_type: type
            nil
          end
        end

        class Identities < ::ActiveRecord::Base; end
      end
    end
  end
end
