module HID
  module Persistence
    module ActiveRecord
      class Recorder
        class Records < ::ActiveRecord::Base; end
        @records_class = Records

        class << self
          attr_accessor :records_class

          def record(input, type)
            records_class.create input: input, id_type: type
            nil
          end

          def recorded(type)
            return typed_records(type) if type
            untyped_records
          end

          private

          def typed_records(type)
            records_class.where(id_type: type).pluck(:input)
          end

          def untyped_records
            record_groups = records_class.all.group_by(&:id_type)
            hash = Hash.new

            record_groups.each do |type, records|
              hash[type] = records.map(&:input) if records
            end

            hash
          end
        end
      end
    end
  end
end
