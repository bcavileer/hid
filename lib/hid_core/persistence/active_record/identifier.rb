module HidCore
  module Persistence
    module ActiveRecord
      class Identifier
        class Identities < ::ActiveRecord::Base; end
        @identities_class = Identities

        class << self
          attr_accessor :identities_class

          def find(input, type)
            identity = identities_class.where(input: input, id_type: type).first
            identity && identity.identity
          end

          def map(input, identity, type)
            identities_class.create input: input, identity: identity, id_type: type
            nil
          end
        end
      end
    end
  end
end
