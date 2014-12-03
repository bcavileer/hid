module HID
  module Persistence
    module ActiveRecord
      class Recorder
        class << self
          def record(input, type)
            Records.create input: input, id_type: type
            nil
          end

          def recorded(type)
            if type
              Records.where(id_type: type).pluck(:input)
            else
              record_groups = Records.all.group_by(&:id_type)
              hash = Hash.new

              record_groups.each do |type, records|
                hash[type] = records.map(&:input) if records
              end

              hash
            end
          end
        end

        class Records < ::ActiveRecord::Base; end
      end
    end
  end
end
